//
//  FrontCard.swift
//  Cultra
//
//  Created by José Miguel Guerrero Jiménez on 15/12/25.
//



import SwiftUI

struct FrontCard: View {
    //let explanation: Explanation
    var body: some View {
            Image(systemName: "questionmark")
            .resizable()
            .scaledToFit()
            .frame(width: 300, height: 300)
            .foregroundStyle(Color.blue)
        }
}


#Preview {
    FrontCard(
        /*explanation: Explanation(
            meaning: "A playful way to tell someone to get started.",
            example: "Let's get this show on the road!",
            image: "CactusMX"
        )*/
    )
}
