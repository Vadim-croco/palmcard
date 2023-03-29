//
//  WordsModel.swift
//  palmcards
//
//  Created by Вадим Мартыненко on 20.03.2023.
//

import Foundation

struct WordsModel: Identifiable, Codable {
    var id: String = UUID().uuidString
    var name: String
    var translate: String
    var examples: String = ""
    var translateExamples: String = ""
    var transcription: String = ""
}
