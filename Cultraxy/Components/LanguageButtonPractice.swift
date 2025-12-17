//
//  LanguageButtonPractice.swift
//  Cultraxy
//
//  Created by José Miguel Guerrero Jiménez on 17/12/25.
//

import SwiftUI

struct LanguageButtonPractice: View {
    let text: String
        
        var body: some View {
            Text(text)
                .font(.subheadline)
                .foregroundColor(.black)
                .bold()
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                
        }
}


#Preview {
    LanguageButtonPractice(text: "Hello")
}
