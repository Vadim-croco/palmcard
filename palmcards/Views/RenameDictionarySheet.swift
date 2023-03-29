//
//  RenameDictionarySheet.swift
//  palmcards
//
//  Created by Вадим Мартыненко on 21.03.2023.
//

import SwiftUI

struct RenameDictionarySheet: View {
    @Binding var showSheet: Bool
    var id: String
    let oldNameDictionary: String
    @EnvironmentObject var dictionaryViewModel: DictionaryViewModel
    @FocusState var focusNameDictionary: Bool
    
    init(showSheet: Binding<Bool>, id: String, oldNameDictionary: String) {
        self._showSheet = showSheet
        self.id = id
        self.oldNameDictionary = oldNameDictionary
    }
    
    @State var nameDictionary: String = ""
    
    var body: some View {
        ZStack{
            Color("background")
                .ignoresSafeArea()
                .onTapGesture {
                    focusNameDictionary = false
                }
            
            VStack{
                HStack{
                    Spacer()
                    Button(action: {
                        showSheet = false
                    }, label: {
                        Image(systemName: "xmark")
                            .font(.title)
                            .tint(Color.primary)
                    })
                }
                .padding()
                Spacer()
                TextField("Новое название словаря", text: $nameDictionary)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(15)
                    .padding(.horizontal)
                    .focused($focusNameDictionary)
                    .onTapGesture {
                        focusNameDictionary = true
                    }
                Button(action: {
                    dictionaryViewModel.renameDictionary(newName: nameDictionary, id: id)
                    nameDictionary = ""
                    showSheet = false
                }, label: {
                    Text("Изменить")
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(nameDictionary.trimmingCharacters(in: .whitespacesAndNewlines) == "" || nameDictionary.trimmingCharacters(in: .whitespacesAndNewlines) == oldNameDictionary ? Color.gray.opacity(0.2) : Color.blue)
                        .cornerRadius(15)
                        .tint(Color.white)
                })
                .padding()
                .disabled(nameDictionary.trimmingCharacters(in: .whitespacesAndNewlines) == "" || nameDictionary.trimmingCharacters(in: .whitespacesAndNewlines) == oldNameDictionary ? true : false)
                Spacer()
            }
        }
        .onAppear{
            nameDictionary = oldNameDictionary
        }
    }
}

struct RenameDictionarySheet_Previews: PreviewProvider {
    static var previews: some View {
        RenameDictionarySheet(showSheet: .constant(true), id: "1", oldNameDictionary: "old name")
            .environmentObject(DictionaryViewModel())
    }
}
