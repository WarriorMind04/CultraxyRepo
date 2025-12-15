//
//  FunFactStore.swift
//  GrootApp
//
//  Created by José Miguel Guerrero Jiménez on 14/12/25.
//


import Foundation



struct FunFactStore {
    static let appGroupID = "group.cultraxyw"
    static let filename = "funfacts.json"

    static func load() -> [FunFactWidgetModel] {
        guard let url = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: appGroupID)?
                .appendingPathComponent(filename),
              let data = try? Data(contentsOf: url) else {
            print("No se pudo encontrar el JSON en el App Group")
            return []
        }

        do {
            let container = try JSONDecoder().decode(FunFactContainer.self, from: data)
            return container.funFacts
        } catch {
            print("Error loading fun facts:", error)
            return []
        }
    }

    // Copia el JSON del bundle al App Group
    static func copyJSONToAppGroup() {
        guard let bundleURL = Bundle.main.url(forResource: "funfacts", withExtension: "json"),
              let groupURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: appGroupID)?
                                .appendingPathComponent(filename) else { return }

        if !FileManager.default.fileExists(atPath: groupURL.path) {
            do {
                try FileManager.default.copyItem(at: bundleURL, to: groupURL)
                print("JSON copiado al App Group ✅")
            } catch {
                print("Error copiando JSON:", error)
            }
        }
    }
}
