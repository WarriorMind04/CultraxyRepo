//
//  CategoryModal.swift
//  Cultra
//
//  Created by José Miguel Guerrero Jiménez on 15/12/25.
//



import SwiftUI

struct CategoryModal: View {
    let category: CultureCategoryModel
        
        var body: some View {
            NavigationStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        
                        // Imagen de la categoría
                        if !category.imageName.isEmpty {
                            Image(category.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 200)
                                .clipped()
                                .cornerRadius(12)
                        }
                        
                        // Título y descripción
                        VStack(alignment: .leading, spacing: 8) {
                            Text(category.title)
                                .font(.largeTitle)
                                .bold()
                            
                            Text(category.description)
                                .font(.body)
                                .foregroundColor(.gray)
                        }
                        
                        Divider()
                        
                        // Secciones
                        ForEach(category.sections) { section in
                            VStack(alignment: .leading, spacing: 12) {
                                Text(section.title)
                                    .font(.title2)
                                    .bold()
                                
                                Text(section.content)
                                    .font(.body)
                                
                                if let imageName = section.imageName, !imageName.isEmpty {
                                    Image(imageName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(height: 180)
                                        .clipped()
                                        .cornerRadius(12)
                                }
                                
                                Divider()
                            }
                        }
                    }
                    .padding()
                }
                .navigationTitle(category.title)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
}


