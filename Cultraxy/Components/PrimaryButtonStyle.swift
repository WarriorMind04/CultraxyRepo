//
//  PrimaryButtonStyle.swift
//  GrootApp
//
//  Created by José Miguel Guerrero Jiménez on 13/12/25.
//

import SwiftUI


struct PrimaryButtonStyle: ButtonStyle {
    let selected: Bool
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(selected ? Color.blueSecondary : Color.gray.opacity(0.3))
            .foregroundColor(selected ? .white : .black)
            .clipShape(Capsule())
    }
}


