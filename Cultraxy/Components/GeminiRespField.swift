//
//  GeminiRespField.swift
//  GrootApp
//
//  Created by José Miguel Guerrero Jiménez on 03/12/25.
//

import SwiftUI

struct GeminiRespField: View {
    //@StateObject private var transvm = TranslatorViewModel()
    @ObservedObject var transvm: TranslatorViewModel
    @State var text: String = "Gemini Response here"
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 330, height: 200)
                .foregroundColor(.blue)
                .cornerRadius(20)
            Text(transvm.explanationn)
                .padding()
        }
        /*.onAppear {
            transvm.getExplanation(for: "Camarón que se duerme, se lo lleva la corriente")
        }*/
    }
}

/*#Preview {
    GeminiRespField()
}
*/
