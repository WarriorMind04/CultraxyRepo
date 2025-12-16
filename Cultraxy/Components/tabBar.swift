//
//  tabBar.swift
//  GrootApp
//
//  Created by José Miguel Guerrero Jiménez on 03/12/25.
//

import SwiftUI

enum Tab {
    case home
    case funFacts
    case culture
}

struct tabBar: View {
    @State private var selectedTab: Tab = .home
    var body: some View {
        
        TabView(selection: $selectedTab) {
            
            NavigationStack {
                FunFactsView()
                    .navigationTitle("Fun Facts")
            }
            .tabItem { Label("Fun Facts", systemImage: "doc.questionmark.fill") }
            .tag(Tab.funFacts)
            
            NavigationStack {
                HomeView()
                    .navigationTitle("Translate")
            }
            .tabItem { Label("Translate", systemImage: "translate") }
            .tag(Tab.home)
            
            NavigationStack {
                CultureView()
                    .navigationTitle("Culture")
            }
            .tabItem { Label("Culture", systemImage: "globe.americas.fill") }
            .tag(Tab.culture)
        }
        .tint(.board)
    }
}

#Preview {
    tabBar()
}
