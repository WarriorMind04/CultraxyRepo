//
//  CultureSection.swift
//  GrootApp
//
//  Created by José Miguel Guerrero Jiménez on 13/12/25.
//

import Foundation

struct CultureSection: Codable, Identifiable {
    let id: Int
    let title: String
    let content: String
    let imageName: String?
}
