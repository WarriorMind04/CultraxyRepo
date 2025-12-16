//
//  CultureCategoryModel.swift
//  GrootApp
//
//  Created by José Miguel Guerrero Jiménez on 13/12/25.
//

import Foundation

struct CultureCategoryModel: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String
    let culture: String
    let country: String
    let imageName: String
    let sections: [CultureSection]
}
