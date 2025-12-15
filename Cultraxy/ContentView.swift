//
//  ContentView.swift
//  Cultraxy
//
//  Created by José Miguel Guerrero Jiménez on 15/12/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var notifications = NotificationManager.instance
    var body: some View {
        
        tabBar()
            .onAppear{
                notifications.requestAuthorization()
                notifications.scheduleRandomDailyNotifications()
            }
            .sheet(isPresented: $notifications.showModalFromNotification) {
                            NotificationModal()
                        }
        
    }
    
}

#Preview {
    ContentView()
}

