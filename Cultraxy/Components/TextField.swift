//
//  TextField.swift
//  GrootApp
//
//  Created by José Miguel Guerrero Jiménez on 03/12/25.
//

import SwiftUI

struct AppTextFieldView: View {
    @State private var text: String = ""
    var onSubmit: (String) -> Void
    var body: some View {
        VStack {
            //Text("Hello, World!")
            HStack {
                //Image(systemName: "person")
                TextField("Write your cultural question here...", text: $text)
                    .onSubmit{
                        onSubmit(text)
                        text = ""
                    }
            }
            .padding()
            .frame(width: 330, height: 200)
            .background(Color(.systemGray6))
            .cornerRadius(8)        }
    }
}

#Preview {
    AppTextFieldView{ prompt in
        print("You typed: \(prompt)")
        
    }
}
