//
//  Country.swift
//  GrootApp
//
//  Created by José Miguel Guerrero Jiménez on 13/12/25.
//

import Foundation

struct Country: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
    let code: String
}
