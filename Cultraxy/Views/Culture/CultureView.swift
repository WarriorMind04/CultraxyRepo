//
//  PractiveView.swift
//  GrootApp
//
//  Created by José Miguel Guerrero Jiménez on 09/12/25.
//

import SwiftUI

struct CultureView: View {
    
    @State private var viewModel = CultureViewModel()
    
    
    var body: some View {
        VStack(spacing: 16) {
            
            // 🔹 Selector de país
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    /*Button("All") { viewModel.filterByCountry(nil) }
                        .buttonStyle(PrimaryButtonStyle(selected: viewModel.selectedCountry == nil))*/
                    
                    ForEach(Array(Set(viewModel.allCategories.map { $0.country })), id: \.self) { country in
                        Button(country) {
                            viewModel.filterByCountry(country)
                        }
                        .buttonStyle(PrimaryButtonStyle(selected: viewModel.selectedCountry == country))
                    }
                }
                .padding(.horizontal)
            }
            
            // 🔹 Tarjetas de categorías
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(viewModel.filteredCategories) { category in
                        CategoryCulture(
                            category: category,
                            onTap: {
                                viewModel.selectCategory(category)
                            }
                        )
                    }
                }
            }
        }
        // 🔹 Modal con Binding manual
        .sheet(isPresented: Binding(
            get: { viewModel.isModalPresented },
            set: { viewModel.isModalPresented = $0 }
        )) {
            if let category = viewModel.selectedCategory {
                CategoryModal(category: category)
            }
        }
    }
}


#Preview {
    CultureView()
}
