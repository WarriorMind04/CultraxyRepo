//
//  CultraxyApp.swift
//  Cultraxy
//
//  Created by José Miguel Guerrero Jiménez on 15/12/25.
//

import SwiftUI
import WidgetKit

//App commit to the new github
@main
struct CultraxyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear{
                    //copyJSONToAppGroup()
                    //printFunFacts()
                    FunFactStore.copyJSONToAppGroup()
                    WidgetCenter.shared.reloadTimelines(ofKind: "FunFactWidget")
                    
                }
                .preferredColorScheme(.light)
        }
    }
}
