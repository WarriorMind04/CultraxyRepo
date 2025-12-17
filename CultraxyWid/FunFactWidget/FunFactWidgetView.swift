//
//  FunFactWidgetView.swift
//  GrootWidgetExtension
//
//  Created by José Miguel Guerrero Jiménez on 14/12/25.
//

import SwiftUI

struct FunFactWidgetView: View {
    var entry: FunFactTimelineProvider.Entry

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(entry.funFact.text)
                .font(.headline)
            Text(entry.funFact.culture)
                .font(.subheadline)
                .foregroundColor(.secondary)
            Text("Source: \(entry.funFact.source)")
                .font(.caption)
                .foregroundColor(.borde)
        }
        .padding()
       
        //.shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
    }
}


