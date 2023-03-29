//
//  EditWordView.swift
//  palmcards
//
//  Created by Вадим Мартыненко on 21.03.2023.
//

import SwiftUI

struct EditWordView: View {
    let idDictionary: String
    let idWord: String
    @EnvironmentObject var dictionaryViewModel: DictionaryViewModel
    @Environment(\.dismiss) var dismiss
    
    enum FocusTextField: Hashable {
        case name
        case translate
        case transcription
        case examples
        case translateExamples
    }
    
    @State var nameTextField: String = ""
    @State var translateTextField: String = ""
    @State var transcriptionTextField: String = ""
    @State var examplesTextField: String = ""
    @State var translateExamplesTextField: String = ""
    
    @State var showReplaceWordSheet: Bool = false
    
    @FocusState private var focusTextField: FocusTextField?
    
    var body: some View {
        ZStack{
            Color("background")
                .ignoresSafeArea()
            
            ScrollView {
                VStack{
                    TextField("Слово", text: $nameTextField)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(15)
                        .padding(.horizontal)
                        .focused($focusTextField, equals: .name)
                        .onTapGesture {
                            focusTextField = .name
                        }
                    
                    TextField("Перевод", text: $translateTextField)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(15)
                        .padding(.horizontal)
                        .focused($focusTextField, equals: .translate)
                        .onTapGesture {
                            focusTextField = .translate
                        }
                    
                    TextField("Транскрипция", text: $transcriptionTextField)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(15)
                        .padding(.horizontal)
                        .focused($focusTextField, equals: .transcription)
                        .onTapGesture {
                            focusTextField = .transcription
                        }
                    
                    TextField("Пример", text: $examplesTextField)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(15)
                        .padding(.horizontal)
                        .focused($focusTextField, equals: .examples)
                        .onTapGesture {
                            focusTextField = .examples
                        }
                    
                    TextField("Перевод примера", text: $translateExamplesTextField)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(15)
                        .padding(.horizontal)
                        .focused($focusTextField, equals: .translateExamples)
                        .onTapGesture {
                            focusTextField = .translateExamples
                        }
                    
                    Button(action: {
                        dictionaryViewModel.renameWord(
                            newName: nameTextField.trimmingCharacters(in: .whitespacesAndNewlines),
                            newTranslate: translateTextField.trimmingCharacters(in: .whitespacesAndNewlines),
                            newTrancription: transcriptionTextField.trimmingCharacters(in: .whitespacesAndNewlines),
                            newExamples: examplesTextField.trimmingCharacters(in: .whitespacesAndNewlines),
                            newTranslateExamples: translateExamplesTextField.trimmingCharacters(in: .whitespacesAndNewlines),
                            idDictionary: idDictionary,
                            idWord: idWord)
                        nameTextField = ""
                        translateTextField = ""
                        dismiss()
                    }, label: {
                        Text("Изменить")
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .background(nameTextField.trimmingCharacters(in: .whitespacesAndNewlines) == "" || translateTextField.trimmingCharacters(in: .whitespacesAndNewlines) == "" || (nameTextField.trimmingCharacters(in: .whitespacesAndNewlines) == dictionaryViewModel.getWordName(idDictionary: idDictionary, idWord: idWord) && translateTextField.trimmingCharacters(in: .whitespacesAndNewlines) == dictionaryViewModel.getWordTranslate(idDictionary: idDictionary, idWord: idWord) && transcriptionTextField.trimmingCharacters(in: .whitespacesAndNewlines) == dictionaryViewModel.getWordTranscription(idDictionary: idDictionary, idWord: idWord) && examplesTextField.trimmingCharacters(in: .whitespacesAndNewlines) == dictionaryViewModel.getWordExamples(idDictionary: idDictionary, idWord: idWord) && translateExamplesTextField.trimmingCharacters(in: .whitespacesAndNewlines) == dictionaryViewModel.getWordTranslateExamples(idDictionary: idDictionary, idWord: idWord)) ? Color.gray.opacity(0.2) : Color.blue)
                            .cornerRadius(15)
                            .tint(Color.white)
                    })
                    .padding()
                    .disabled(nameTextField.trimmingCharacters(in: .whitespacesAndNewlines) == "" || translateTextField.trimmingCharacters(in: .whitespacesAndNewlines) == "" || (nameTextField.trimmingCharacters(in: .whitespacesAndNewlines) == dictionaryViewModel.getWordName(idDictionary: idDictionary, idWord: idWord) && translateTextField.trimmingCharacters(in: .whitespacesAndNewlines) == dictionaryViewModel.getWordTranslate(idDictionary: idDictionary, idWord: idWord) && transcriptionTextField.trimmingCharacters(in: .whitespacesAndNewlines) == dictionaryViewModel.getWordTranscription(idDictionary: idDictionary, idWord: idWord) && examplesTextField.trimmingCharacters(in: .whitespacesAndNewlines) == dictionaryViewModel.getWordExamples(idDictionary: idDictionary, idWord: idWord) && translateExamplesTextField.trimmingCharacters(in: .whitespacesAndNewlines) == dictionaryViewModel.getWordTranslateExamples(idDictionary: idDictionary, idWord: idWord)) ? true : false)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .onTapGesture {
                focusTextField = nil
            }
        }
        .onAppear{
//            nameTextField = dictionaryViewModel.getWordName(idDictionary: idDictionary, idWord: idWord)
//            translateTextField = dictionaryViewModel.getWordTranslate(idDictionary: idDictionary, idWord: idWord)
            let wordModel: WordsModel = dictionaryViewModel.getModelWord(idDictionary: idDictionary, idWord: idWord)
            
            nameTextField = wordModel.name
            translateTextField = wordModel.translate
            transcriptionTextField = wordModel.transcription
            examplesTextField = wordModel.examples
            translateExamplesTextField = wordModel.translateExamples
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    showReplaceWordSheet = true
                }, label: {
                    Image(systemName: "lasso.and.sparkles")
                        .tint(Color.red)
                })
                .disabled(dictionaryViewModel.dictionaries.count < 2)
            }
        }
        .sheet(isPresented: $showReplaceWordSheet) {
            ReplaceWordSheet(showReplaceWordSheet: $showReplaceWordSheet, idDictionary: idDictionary, idWord: idWord, dismiss: dismissFunc)
        }
    }
    
    func dismissFunc() {
        dismiss()
    }
}

struct EditWordView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EditWordView(idDictionary: "1", idWord: "2")
        }
        .environmentObject(DictionaryViewModel())
    }
}
