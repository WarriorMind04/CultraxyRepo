//
//  GrootWidgetLiveActivity.swift
//  GrootWidget
//
//  Created by José Miguel Guerrero Jiménez on 14/12/25.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct GrootWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct GrootWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: GrootWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension GrootWidgetAttributes {
    fileprivate static var preview: GrootWidgetAttributes {
        GrootWidgetAttributes(name: "World")
    }
}

extension GrootWidgetAttributes.ContentState {
    fileprivate static var smiley: GrootWidgetAttributes.ContentState {
        GrootWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: GrootWidgetAttributes.ContentState {
         GrootWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: GrootWidgetAttributes.preview) {
   GrootWidgetLiveActivity()
} contentStates: {
    GrootWidgetAttributes.ContentState.smiley
    GrootWidgetAttributes.ContentState.starEyes
}
