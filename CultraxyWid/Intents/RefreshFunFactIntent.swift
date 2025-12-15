//
//  RefreshFunFactIntent.swift
//  GrootWidgetExtension
//
//  Created by José Miguel Guerrero Jiménez on 14/12/25.
//

import Foundation
import WidgetKit
import AppIntents

struct RefreshFunFactIntent: AppIntent {
    static var title: LocalizedStringResource = "New Fun Fact"

    func perform() async throws -> some IntentResult {
        WidgetCenter.shared.reloadTimelines(ofKind: "FunFactWidget")
        return .result()
    }
}
