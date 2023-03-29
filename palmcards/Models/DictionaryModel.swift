//
//  Dictionary.swift
//  palmcards
//
//  Created by Вадим Мартыненко on 20.03.2023.
//

import Foundation

struct DictionaryModel: Identifiable, Codable {
    var id: String = UUID().uuidString
    var name: String
    var words: [WordsModel] = []
    
    func changeName(newName: String) -> DictionaryModel {
        return DictionaryModel(id: id, name: newName, words: words)
    }
}
