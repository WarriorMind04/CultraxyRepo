//
//  CultureViewModel.swift
//  GrootApp
//
//  Created by José Miguel Guerrero Jiménez on 13/12/25.
//

import Foundation

@Observable
class CultureViewModel {
    
    var allCategories: [CultureCategoryModel] = []
    var filteredCategories: [CultureCategoryModel] = []
    
    var selectedCountry: String? = nil
    var selectedCategory: CultureCategoryModel? = nil
    var isModalPresented: Bool = false
    
    init() {
        loadCulture()
        selectDefaultCountry()
    }
    
    private func loadCulture() {
        guard let url = Bundle.main.url(forResource: "culturedata", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let decoded = try? JSONDecoder().decode(CultureResponse.self, from: data)
        else {
            print("❌ Error loading culturedata.json")
            return
        }
        allCategories = decoded.categories
        filteredCategories = allCategories
        if let first = filteredCategories.first {
                    self.selectedCategory = first
                    //self.isModalPresented = true
                }
    }
    
    // 🔹 Nueva función para seleccionar país por defecto
        private func selectDefaultCountry() {
            // Obtener el primer país disponible
            if let firstCountry = allCategories.first?.country {
                filterByCountry(firstCountry)
            }
        }
    
    func filterByCountry(_ country: String?) {
        selectedCountry = country
        if let country = country {
            filteredCategories = allCategories.filter { $0.country == country }
        } else {
            filteredCategories = allCategories
        }
    }
    
    func selectCategory(_ category: CultureCategoryModel) {
        selectedCategory = category
        isModalPresented = true
    }
}
