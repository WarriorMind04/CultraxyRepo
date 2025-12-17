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
                IdiomPracticeView()
                    .navigationTitle("Idiom Practice")
            }
            .tabItem { Label("Practice", systemImage: "pencil.and.outline") }
            .tag(Tab.culture)
        }
        .tint(.board)
    }
}

#Preview {
    tabBar()
}
