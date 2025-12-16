
//
//  Language.swift
//  GrootApp
//
//  Created by Estrella Verdiguel on 15/12/25.
//

import Foundation

struct Language: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let code: String
    let flag: String
    
    static let allLanguages: [Language] = [
        Language(name: "Spanish", code: "es", flag: "🇪🇸"),
        Language(name: "English", code: "en", flag: "🇺🇸"),
        Language(name: "French", code: "fr", flag: "🇫🇷"),
        Language(name: "German", code: "de", flag: "🇩🇪"),
        Language(name: "Italian", code: "it", flag: "🇮🇹"),
        Language(name: "Portuguese", code: "pt", flag: "🇵🇹"),
        Language(name: "Chinese", code: "zh", flag: "🇨🇳"),
        Language(name: "Japanese", code: "ja", flag: "🇯🇵"),
        Language(name: "Korean", code: "ko", flag: "🇰🇷"),
        Language(name: "Russian", code: "ru", flag: "🇷🇺"),
        Language(name: "Arabic", code: "ar", flag: "🇸🇦"),
        Language(name: "Hindi", code: "hi", flag: "🇮🇳"),
        Language(name: "Dutch", code: "nl", flag: "🇳🇱"),
        Language(name: "Polish", code: "pl", flag: "🇵🇱"),
        Language(name: "Turkish", code: "tr", flag: "🇹🇷"),
        Language(name: "Swedish", code: "sv", flag: "🇸🇪"),
        Language(name: "Greek", code: "el", flag: "🇬🇷"),
        Language(name: "Czech", code: "cs", flag: "🇨🇿"),
        Language(name: "Danish", code: "da", flag: "🇩🇰"),
        Language(name: "Finnish", code: "fi", flag: "🇫🇮")
    ]
    
    static var spanish: Language {
        allLanguages.first { $0.code == "es" }!
    }
    
    static var english: Language {
        allLanguages.first { $0.code == "en" }!
    }
}
