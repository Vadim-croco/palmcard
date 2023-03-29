//
//  DictionaryView.swift
//  palmcards
//
//  Created by Вадим Мартыненко on 20.03.2023.
//

import SwiftUI

struct DictionaryView: View {
    @EnvironmentObject var dictionaryViewModel: DictionaryViewModel
    @State var showSheet: Bool = false
    @State var search: String = ""
    @State private var editMode: EditMode = .inactive
    
    var body: some View {
        NavigationStack {
            if dictionaryViewModel.dictionaries.isEmpty {
                NoItemDictionaryView()
                    .navigationTitle("Словари")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                self.showSheet = true
                            }) {
                                Image(systemName: "plus")
                                    .foregroundColor(Color.red)
                            }
                        }
                    }
            } else {
                ZStack{
                    Color("background")
                        .ignoresSafeArea()
                    
                    List {
                        ForEach(filteredDictionaries){ item in
                            NavigationLink(item.name, destination: WordsView(id: item.id))
                        }
                        .onDelete(perform: dictionaryViewModel.deleteDictionary)
                        .onMove(perform: dictionaryViewModel.moveDictionary)
                        
                        if filteredDictionaries.isEmpty {
                            Spacer()
                                .listRowBackground(Color.clear)
                        }
                    }
                    .animation(.easeInOut, value: editMode)
                    .environment(\.editMode, $editMode)
                }
                .searchable(text: $search, prompt: "Искать")
                .navigationTitle("Словари")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack {
                            EditButtonComponent(editMode: $editMode)
                            
                            Button(action: {
                                self.showSheet = true
                            }) {
                                Image(systemName: "plus")
                                    .foregroundColor(Color.red)
                            }
                        }
                    }
                    
                }
            }
        }
        .sheet(isPresented: $showSheet, content: {AddDictionarySheet(showSheet: $showSheet)})
    }
    
    var filteredDictionaries: [DictionaryModel] {
        if search.isEmpty {
            return dictionaryViewModel.dictionaries
        } else {
            return dictionaryViewModel.dictionaries.filter {$0.name.lowercased().contains(search.lowercased())}
        }
    }
}

struct DictionaryView_Previews: PreviewProvider {
    static var previews: some View {
        DictionaryView()
            .environmentObject(DictionaryViewModel())
    }
}
