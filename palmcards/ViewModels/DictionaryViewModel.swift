//
//  DictionaryViewModel.swift
//  palmcards
//
//  Created by Вадим Мартыненко on 20.03.2023.
//

import Foundation

class DictionaryViewModel: ObservableObject {
    @Published var dictionaries: [DictionaryModel] = [] {
        didSet {
            saveDictionaries()
        }
    }
    
    private let dictionariesKey: String = "dictionaries"
    private let selectDictionaryKey: String = "selectDictionary"
    
    init(){
        if let data = UserDefaults.standard.data(forKey: dictionariesKey) {
            let savedItems = try? JSONDecoder().decode([DictionaryModel].self, from: data)
                if let takeSavedItems = savedItems {
                    self.dictionaries = takeSavedItems
                }
        }
    }
    
    func getName(id: String) -> String {
        if let item = dictionaries.first(where: {$0.id == id}) {
            return item.name
        } else {
            return "Error"
        }
    }
    
    func getListWord(id: String) -> [WordsModel] {
        if let item = dictionaries.first(where: {$0.id == id}) {
            return item.words
        } else {
            return []
        }
    }
    
    func getWordName(idDictionary: String, idWord: String) -> String {
        if let dictionary = dictionaries.first(where: {$0.id == idDictionary}) {
            if let word = dictionary.words.first(where: {$0.id == idWord}) {
                return word.name
            } else {
                return "Word dont found"
            }
        } else {
            return "Dictionary dont found"
        }
    }
    
    func getWordTranslate(idDictionary: String, idWord: String) -> String {
        if let dictionary = dictionaries.first(where: {$0.id == idDictionary}) {
            if let word = dictionary.words.first(where: {$0.id == idWord}) {
                return word.translate
            } else {
                return "Word dont found"
            }
        } else {
            return "Dictionary dont found"
        }
    }
    
    func getWordTranscription(idDictionary: String, idWord: String) -> String {
        if let dictionary = dictionaries.first(where: {$0.id == idDictionary}) {
            if let word = dictionary.words.first(where: {$0.id == idWord}) {
                return word.transcription
            } else {
                return "Word dont found"
            }
        } else {
            return "Dictionary dont found"
        }
    }
    
    func getWordExamples(idDictionary: String, idWord: String) -> String {
        if let dictionary = dictionaries.first(where: {$0.id == idDictionary}) {
            if let word = dictionary.words.first(where: {$0.id == idWord}) {
                return word.examples
            } else {
                return "Word dont found"
            }
        } else {
            return "Dictionary dont found"
        }
    }
    
    func getWordTranslateExamples(idDictionary: String, idWord: String) -> String {
        if let dictionary = dictionaries.first(where: {$0.id == idDictionary}) {
            if let word = dictionary.words.first(where: {$0.id == idWord}) {
                return word.translateExamples
            } else {
                return "Word dont found"
            }
        } else {
            return "Dictionary dont found"
        }
    }
    
    func getModelWord(idDictionary: String, idWord: String) -> WordsModel {
        if let dictionary = dictionaries.first(where: {$0.id == idDictionary}) {
            if let word = dictionary.words.first(where: {$0.id == idWord}) {
                return word
            } else {
                return WordsModel(name: "Word dont found", translate: "word dont found")
            }
        } else {
            return WordsModel(name: "Dictionary dont found", translate: "Dictionary dont found")
        }
    }
    
    func replaceWordToAnotherDictionary(idThisDictionary: String, idToDictionary: String, idWord: String) {
        if let thisDictionaryIndex = dictionaries.firstIndex(where: {$0.id == idThisDictionary}) {
            if let word = dictionaries[thisDictionaryIndex].words.first(where: {$0.id == idWord}) {
                if let index = dictionaries.firstIndex(where: {$0.id == idToDictionary}) {
                    dictionaries[index].words.append(word)
                    dictionaries[thisDictionaryIndex].words = dictionaries[thisDictionaryIndex].words.filter{$0.id != word.id}
                }
            }
        }
    }
    
    func renameDictionary(newName: String, id: String){
        if let index = dictionaries.firstIndex(where: {$0.id == id}) {
            dictionaries[index].name = newName.trimmingCharacters(in: .whitespacesAndNewlines)
        }
    }
    
    func renameWord(newName: String, newTranslate: String, newTrancription: String, newExamples: String, newTranslateExamples: String, idDictionary: String, idWord: String) {
        if let indexDictionary = dictionaries.firstIndex(where: {$0.id == idDictionary}) {
            if let indexWord = dictionaries[indexDictionary].words.firstIndex(where: {$0.id == idWord}) {
                dictionaries[indexDictionary].words[indexWord].name = newName.trimmingCharacters(in: .whitespacesAndNewlines)
                dictionaries[indexDictionary].words[indexWord].translate = newTranslate.trimmingCharacters(in: .whitespacesAndNewlines)
                dictionaries[indexDictionary].words[indexWord].transcription = newTrancription.trimmingCharacters(in: .whitespacesAndNewlines)
                dictionaries[indexDictionary].words[indexWord].examples = newExamples.trimmingCharacters(in: .whitespacesAndNewlines)
                dictionaries[indexDictionary].words[indexWord].translateExamples = newTranslateExamples.trimmingCharacters(in: .whitespacesAndNewlines)
            }
        }

    }
    
    func addDictionary(name: String) {
        dictionaries.insert(DictionaryModel(name: name), at: 0)
    }
    
    func addWords(name: String, translate: String, transcription: String, examples: String, translateExamples: String, id: String) {
        if let index = dictionaries.firstIndex(where: {$0.id == id}) {
            dictionaries[index].words.insert(
                WordsModel(
                    name: name,
                    translate: translate,
                    examples: examples,
                    translateExamples: translateExamples,
                    transcription: transcription
            ), at: 0)
        }
    }
    
    func deleteDictionary(indexSet: IndexSet) {
        dictionaries.remove(atOffsets: indexSet)
    }
    
    func deleteWord(indexSet: IndexSet, id: String) {
        if let index = dictionaries.firstIndex(where: {$0.id == id}) {
            dictionaries[index].words.remove(atOffsets: indexSet)
        }
    }
    
    func moveDictionary(from: IndexSet, to: Int) {
        dictionaries.move(fromOffsets: from, toOffset: to)
    }
    
    func moveWord(from: IndexSet, to: Int, id: String) {
        if let index = dictionaries.firstIndex(where: {$0.id == id}) {
            dictionaries[index].words.move(fromOffsets: from, toOffset: to)
        }
    }
    
    func saveDictionaries() {
        if let encodingData = try? JSONEncoder().encode(dictionaries) {
            UserDefaults.standard.set(encodingData, forKey: dictionariesKey)
        }
    }
}
