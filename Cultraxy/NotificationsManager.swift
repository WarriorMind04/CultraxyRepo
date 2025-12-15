//
//  NotificationsManager.swift
//  Cultra
//
//  Created by José Miguel Guerrero Jiménez on 15/12/25.
//

import Foundation
import UserNotifications
import Combine

class NotificationManager: NSObject, ObservableObject, UNUserNotificationCenterDelegate {
    
    static let instance = NotificationManager()
    @Published var showModalFromNotification: Bool = false
    
    private override init() {
        super.init()
        UNUserNotificationCenter.current().delegate = self
    }
    
    // MARK: - Pedir Permisos
    func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else if success {
                print("Notifications allowed")
            }
        }
    }
    
    // MARK: - Programar 3 notificaciones aleatorias
    func scheduleRandomDailyNotifications() {
        
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        
        let messages = [
            ("Tu frase del día", "Descubre un nuevo modismo cultural."),
            ("Aprende algo nuevo", "Vamos a explorar otro significado interesante."),
            ("Un idioma a la vez", "Aquí va una expresión útil para ti.")
        ]
        
        for i in 0..<3 {
            let hour = Int.random(in: 8...21)
            let minute = Int.random(in: 0...59)
            
            let content = UNMutableNotificationContent()
            content.title = messages[i].0
            content.subtitle = messages[i].1
            content.sound = .default
            
            // IMPORTANTE: info para detectar que viene de notificación
            content.userInfo = ["openModal": true]
            
            var dateComponents = DateComponents()
            dateComponents.hour = hour
            dateComponents.minute = minute
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
            
            let request = UNNotificationRequest(
                identifier: "daily_random_\(i)",
                content: content,
                trigger: trigger
            )
            
            UNUserNotificationCenter.current().add(request)
            
            print("Notification \(i+1) programada a las \(hour):\(minute)")
        }
    }

    // MARK: - Detectar cuando el usuario toca la notificación
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        
        let userInfo = response.notification.request.content.userInfo
        
        if let shouldOpen = userInfo["openModal"] as? Bool, shouldOpen == true {
            DispatchQueue.main.async {
                self.showModalFromNotification = true
            }
        }
        
        completionHandler()
    }
}
