//
//  PractiveView.swift
//  GrootApp
//
//  Created by José Miguel Guerrero Jiménez on 09/12/25.
//


import SwiftUI

extension Array where Element: Hashable {
    func uniqued() -> [Element] {
        var seen = Set<Element>()
        return filter { seen.insert($0).inserted }
    }
}
struct CultureView: View {
    
    @State private var viewModel = CultureViewModel()
    
    
    var body: some View {
        
        VStack(spacing: 16) {
            Spacer()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(Array(Set(viewModel.allCategories.map { $0.country })).sorted(), id: \.self) { country in
                        Button(country) {
                            viewModel.filterByCountry(country)
                        }
                        .buttonStyle(PrimaryButtonStyle(selected: viewModel.selectedCountry == country))
                    }
                }
                .padding(.horizontal)
            }
            
            ScrollView {
                Spacer()
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
            Spacer()
        }
        .background(Color.board.opacity(0.05))
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
