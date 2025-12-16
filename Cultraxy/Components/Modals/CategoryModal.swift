//
//  CategoryModal.swift
//  GrootApp
//
//  Created by José Miguel Guerrero Jiménez on 12/12/25.
//

import SwiftUI

struct CategoryModal: View {
    let category: CultureCategoryModel
        
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    
                    // Imagen de la categoría con borde verde
                    if !category.imageName.isEmpty {
                        Image(category.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .clipped()
                            .cornerRadius(12)
                           
                    }
                    
                    // Título y descripción con acento verde
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Rectangle()
                                .fill(Color.board)
                                .frame(width: 4, height: 40)
                            
                            Text(category.title)
                                .font(.largeTitle)
                                .bold()
                        }
                        
                        Text(category.description)
                            .font(.body)
                            .foregroundColor(.gray)
                    }
                    
                    Divider()
                        .frame(height: 2)
                        .overlay(Color.board)
                    
                    // Secciones con acentos verdes
                    ForEach(category.sections) { section in
                        VStack(alignment: .leading, spacing: 12) {
                            HStack(spacing: 8) {
                                Circle()
                                    .fill(Color.board)
                                    .frame(width: 8, height: 8)
                                
                                Text(section.title)
                                    .font(.title2)
                                    .bold()
                                    .foregroundColor(Color.board)
                            }
                            
                            Text(section.content)
                                .font(.body)
                                .padding(.leading, 16)
                            
                            if let imageName = section.imageName, !imageName.isEmpty {
                                Image(imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 180)
                                    .clipped()
                                    .cornerRadius(12)
                            }
                            
                            Divider()
                                .overlay(Color.board.opacity(0.3))
                        }
                    }
                }
                .padding()
            }
            .navigationTitle(category.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.board.opacity(0.1), for: .navigationBar)
        }
    }
}




