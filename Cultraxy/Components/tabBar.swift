//
//  tabBar.swift
//  GrootApp
//
//  Created by José Miguel Guerrero Jiménez on 03/12/25.
//

import SwiftUI

struct tabBar: View {
    var body: some View {
        
        TabView {
            NavigationStack {
                HomeView()
                    .navigationTitle("Home")
            }
            .tabItem { Label("Home", systemImage: "house.fill") }

            NavigationStack {
                FunFactsView()
                    .navigationTitle("Fun Facts")
            }
            .tabItem { Label("Fun Facts", systemImage: "doc.questionmark.fill") }

            NavigationStack {
                CultureView()
                    .navigationTitle("Culture")
            }
            .tabItem { Label("Culture", systemImage: "globe.americas.fill") }
        }
    }
}

#Preview {
    tabBar()
}
