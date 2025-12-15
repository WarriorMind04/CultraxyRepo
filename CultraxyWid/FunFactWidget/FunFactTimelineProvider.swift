//
//  FunFactTimelineProvider.swift
//  GrootApp
//
//  Created by José Miguel Guerrero Jiménez on 14/12/25.
//

import WidgetKit

struct FunFactTimelineProvider: TimelineProvider {

    func placeholder(in context: Context) -> FunFactEntry {
        FunFactEntry(
            date: .now,
            funFact: .placeholder
        )
    }

    func getSnapshot(in context: Context, completion: @escaping (FunFactEntry) -> Void) {
        completion(placeholder(in: context))
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<FunFactEntry>) -> Void) {
        var facts = FunFactStore.load().shuffled()
        print("Loaded facts in widget:", facts)
        if facts.isEmpty {
            facts = [.placeholder]
        }

        let startDate = Date()

        let entries: [FunFactEntry] = facts.enumerated().compactMap { index, fact in
            guard let date = Calendar.current.date(
                byAdding: .hour,
                value: index * 6,
                to: startDate
            ) else {
                return nil
            }
            return FunFactEntry(
                date: date,
                funFact: fact
            )
        }

        completion(Timeline(entries: entries, policy: .atEnd))
    }
    
}
