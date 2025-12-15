//
//  GrootWidgetBundle.swift
//  GrootWidget
//
//  Created by José Miguel Guerrero Jiménez on 14/12/25.
//

import WidgetKit
import SwiftUI

@main
struct GrootWidgetBundle: WidgetBundle {
    var body: some Widget {
        FunFactWidget()
        GrootWidgetControl()
        GrootWidgetLiveActivity()
    }
}
