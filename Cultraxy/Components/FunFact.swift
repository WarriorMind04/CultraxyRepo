//
//  FunFact.swift
//  GrootApp
//
//  Created by José Miguel Guerrero Jiménez on 12/12/25.
//

import SwiftUI

struct FunFact: View {
    var body: some View {
        VStack{
            Image(systemName: "person.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .padding()
            Text("Did you know that....?")
                .font(.largeTitle)
        }
    }
}

#Preview {
    FunFact()
}
