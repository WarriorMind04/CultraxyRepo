//
//  GrootWidget.swift
//  GrootWidget
//
//  Created by José Miguel Guerrero Jiménez on 14/12/25.
//

import WidgetKit
import SwiftUI



struct FunFactWidget: Widget {
    let kind: String = "FunFactWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: FunFactTimelineProvider()) { entry in
            FunFactWidgetView(entry: entry)
                .containerBackground(Color.board, for: .widget)
        }
        .configurationDisplayName("Fun Facts")
        .description("Learn fun facts about different cultures!")
        .supportedFamilies([.systemMedium, .systemLarge])
    }
}
