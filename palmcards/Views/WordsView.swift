//
//  WordsView.swift
//  palmcards
//
//  Created by Вадим Мартыненко on 20.03.2023.
//

import SwiftUI

struct WordsView: View {
    var id: String
    @EnvironmentObject var dictionaryViewModel: DictionaryViewModel
    
    @State var showSheetAdd: Bool = false
    @State var showSheetRename: Bool = false
    @State var search: String = ""
    @State var chag: Bool = false
    
    @State private var editMode: EditMode = .inactive
    
    var body: some View {
        ZStack{
            Color("background")
                .ignoresSafeArea()
            if dictionaryViewModel.getListWord(id: id).isEmpty {
                NoItemWordsView()
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            HStack{
                                Button(action: {
                                    self.showSheetAdd = true
                                }) {
                                    Image(systemName: "plus")
                                        .tint(Color.red)
                                }
                                Button(action: {
                                    self.showSheetRename = true
                                }, label: {
                                    Image(systemName: "pencil")
                                        .tint(Color.red)
                                })
                            }
                        }
                    }
            } else {
                List {
                    ForEach(filteredWords) { item in
                        NavigationLink(destination: EditWordView(idDictionary: id, idWord: item.id), label: {
                            HStack{
                                Text(item.name)
                                    .font(.headline)
                                Spacer()
                                Text(item.translate)
                                    .font(.footnote)
                                    .foregroundColor(Color.secondary)
                            }
                        })
                    }
                    .onDelete { IndexSet in
                        dictionaryViewModel.deleteWord(indexSet: IndexSet, id: id)
                    }
                    .onMove { IndexSet, To in
                        dictionaryViewModel.moveWord(from: IndexSet, to: To, id: id)
                    }
                    
                    if filteredWords.isEmpty {
                        Spacer()
                            .listRowBackground(Color.clear)
                    }
                }
                .animation(.easeInOut, value: editMode)
                .environment(\.editMode, $editMode)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack{
                            EditButtonComponent(editMode: $editMode)
                            Button(action: {
                                self.showSheetRename = true
                            }, label: {
                                Image(systemName: "pencil")
                                    .tint(Color.red)
                            })
                            Button(action: {
                                self.showSheetAdd = true
                            }) {
                                Image(systemName: "plus")
                                    .tint(Color.red)
                            }
                            
                        }
                    }
                }
                .searchable(text: $search, placement: chag || UIDevice.current.userInterfaceIdiom == .pad ? .toolbar : .navigationBarDrawer(displayMode: .always) ,prompt: "Искать")
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.6, execute: {
                        self.chag = true
                    })
                }
            }
        }
        .sheet(isPresented: $showSheetAdd, content: {
            AddWordSheet(showSheetAdd: $showSheetAdd, id: id)
        })
        .sheet(isPresented: $showSheetRename, content: {
            RenameDictionarySheet(showSheet: $showSheetRename, id: id, oldNameDictionary: dictionaryViewModel.getName(id: id))
        })
        .navigationTitle(dictionaryViewModel.getName(id: id))
    }
    
    var filteredWords: [WordsModel] {
        if search.isEmpty {
            return dictionaryViewModel.getListWord(id: id)
        } else {
            return dictionaryViewModel.getListWord(id: id).filter{$0.name.lowercased().contains(search.lowercased()) || $0.translate.lowercased().contains(search.lowercased())}
        }
    }
}

struct WordsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WordsView(id: "1")
        }
        .environmentObject(DictionaryViewModel())
    }
}
