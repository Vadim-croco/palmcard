//
//  AddWordSheet.swift
//  palmcards
//
//  Created by Вадим Мартыненко on 21.03.2023.
//

import SwiftUI

struct AddWordSheet: View {
    @Binding var showSheetAdd: Bool
    var id: String
    @EnvironmentObject var dictionaryViewModel: DictionaryViewModel
    
    @State var nameTextField: String = ""
    @State var translateTextField: String = ""
    @State var examplesTextField: String = ""
    @State var translateExamplesTextField: String = ""
    @State var transcriptionTextField: String = ""
    
    enum FocusedTextField {
        case name
        case translate
        case examples
        case translateExamples
        case transcription
    }
    
    @FocusState var focusedTextField: FocusedTextField?
    
    var body: some View {
        ZStack{
            Color("background")
                .ignoresSafeArea()
                .onTapGesture {
                    focusedTextField = nil
                }
            
            VStack{
                HStack{
                    Spacer()
                    Button(action: {
                        self.showSheetAdd = false
                    }, label: {
                        Image(systemName: "xmark")
                            .font(.title)
                            .tint(Color.primary)
                    })
                }
                .padding()
                Spacer()
                
                TextField("Слово", text: $nameTextField)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(15)
                    .padding(.horizontal)
                    .focused($focusedTextField, equals: .name)
                    .onTapGesture {
                        focusedTextField = .name
                    }
                
                TextField("Перевод", text: $translateTextField)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(15)
                    .padding(.horizontal)
                    .focused($focusedTextField, equals: .translate)
                    .onTapGesture {
                        focusedTextField = .translate
                    }
                
                TextField("Транскрипция", text: $transcriptionTextField)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(15)
                    .padding(.horizontal)
                    .focused($focusedTextField, equals: .transcription)
                    .onTapGesture {
                        focusedTextField = .transcription
                    }
                
                TextField("Пример", text: $examplesTextField)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(15)
                    .padding(.horizontal)
                    .focused($focusedTextField, equals: .examples)
                    .onTapGesture {
                        focusedTextField = .examples
                    }
                
                TextField("Перевод примера", text: $translateExamplesTextField)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(15)
                    .padding(.horizontal)
                    .focused($focusedTextField, equals: .translateExamples)
                    .onTapGesture {
                        focusedTextField = .translateExamples
                    }
                
                Button(action: {
                    dictionaryViewModel.addWords(
                        name: nameTextField.trimmingCharacters(in: .whitespacesAndNewlines),
                        translate: translateTextField.trimmingCharacters(in: .whitespacesAndNewlines),
                        transcription: transcriptionTextField.trimmingCharacters(in: .whitespacesAndNewlines),
                        examples: examplesTextField.trimmingCharacters(in: .whitespacesAndNewlines),
                        translateExamples: translateExamplesTextField.trimmingCharacters(in: .whitespacesAndNewlines),
                        id: id)
                    self.showSheetAdd = false
                }, label: {
                    Text("Добавить")
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(nameTextField.trimmingCharacters(in: .whitespacesAndNewlines) == "" || translateTextField.trimmingCharacters(in: .whitespacesAndNewlines) == "" ? Color.gray.opacity(0.2) : Color.blue)
                        .cornerRadius(15)
                        .tint(Color.white)
                })
                .padding()
                .disabled(nameTextField.trimmingCharacters(in: .whitespacesAndNewlines) == "" || translateTextField.trimmingCharacters(in: .whitespacesAndNewlines) == "" ? true : false)
                Spacer()
            }
        }
    }
}

struct AddWordSheet_Previews: PreviewProvider {
    static var previews: some View {
        AddWordSheet(showSheetAdd: .constant(true), id: "asd")
            .environmentObject(DictionaryViewModel())
    }
}
