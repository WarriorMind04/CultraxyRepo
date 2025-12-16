//
//  CategoryCulture.swift
//  GrootApp
//
//  Created by José Miguel Guerrero Jiménez on 12/12/25.
//

import SwiftUI


struct CategoryCulture: View {
    let category: CultureCategoryModel
    let onTap: () -> Void
    
    var body: some View {
        ZStack {
            // Sombra de fondo con degradado
            RoundedRectangle(cornerRadius: 16)
                .fill(
                    LinearGradient(
                        colors: [Color.board.opacity(0.4), Color.board.opacity(0.2)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(height: 120)
                .offset(y: 6)
            
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
                .frame(height: 120)
                .overlay(
                    HStack(spacing: 16) {
                        
                        VStack(alignment: .leading, spacing: 8) {
                            // Título con ícono de bandera o país
                            HStack(spacing: 6) {
                                Text(category.title)
                                    .font(.title3)
                                    .foregroundStyle(Color.black)
                                    .bold()
                                    .lineLimit(2)
                            }
                            
                            Text(category.description)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .lineLimit(2)
                            
                            // Tag del país
                            HStack(spacing: 4) {
                                Image(systemName: "mappin.circle.fill")
                                    .font(.caption)
                                    .foregroundColor(Color.board)
                                Text(category.country)
                                    .font(.caption)
                                    .foregroundColor(Color.board)
                            }
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.board.opacity(0.1))
                            .cornerRadius(8)
                        }
                        
                        Spacer()
                        
                        // Botón mejorado con ícono
                        Button(action: onTap) {
                            HStack(spacing: 4) {
                                Text("View")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                Image(systemName: "arrow.right.circle.fill")
                                    .font(.subheadline)
                            }
                            .foregroundColor(.white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 10)
                            .background(
                                LinearGradient(
                                    colors: [Color.board, Color.board.opacity(0.8)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .clipShape(Capsule())
                            .shadow(color: Color.board.opacity(0.3), radius: 4, x: 0, y: 2)
                        }
                        .buttonStyle(ScaleButtonStyle())
                    }
                    .padding(.horizontal, 16)
                )
        }
        .padding(.horizontal)
    }
}

// ButtonStyle para animación de escala
struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}


#Preview {
    CategoryCulture(
        category: CultureCategoryModel(
            id: 1,
            title: "Food & Traditions",
            description: "Discover traditional dishes, customs and cultural meanings.",
            culture: "Mexican Culture",
            country: "Mexico",
            imageName: "mexico",
            sections: []
        ),
        onTap: {
            print("View more tapped")
        }
    )
    .padding()
}




