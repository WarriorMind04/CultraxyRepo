//
//  HomeView.swift
//  GrootApp
//
//  Created by José Miguel Guerrero Jiménez on 03/12/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var transvm = TranslatorViewModel()
    
    var body: some View {
        VStack{
            AppTextFieldView{ prompt in
                transvm.getExplanation(for: prompt)
            }
                .padding()
            GeminiRespField(transvm: transvm)
        } //Bocca al lupo

        
        
    }
}

#Preview {
    HomeView()
}
