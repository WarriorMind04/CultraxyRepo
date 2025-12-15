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
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.blueSecondary.opacity(0.3))
                .frame(height: 120)
                .offset(y: 6)
            
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .shadow(radius: 4)
                .frame(height: 120)
                .overlay(
                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(category.title)
                                .font(.title3)
                                .foregroundStyle(Color.black)
                                .bold()
                            Text(category.description)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Button("VIEW MORE", action: onTap)
                            .foregroundColor(.white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color.blueSecondary)
                            .clipShape(Capsule())
                    }
                    .padding(.horizontal, 24)
                )
        }
        .padding(.horizontal)
    }
}


