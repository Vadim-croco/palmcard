//
//  ItemListSelectDictionaries.swift
//  palmcards
//
//  Created by Вадим Мартыненко on 28.03.2023.
//

import SwiftUI

struct ItemListSelectDictionaries: View {
    @Binding var chosenDictionaries: [String]
    
    var nameDictionary: String
    var idDictionary: String
    
    var body: some View {
        HStack{
            Text(nameDictionary)
            Spacer()
            ZStack{
                Rectangle()
                    .frame(width: 30, height: 30)
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 25, height: 25)
                    Image(systemName: "checkmark")
                        .foregroundColor(Color.green)
                        .font(.title2)
                        .opacity(chosenDictionaries.contains(idDictionary) ? 1 : 0)
            }
        }
        .onTapGesture {
            if !chosenDictionaries.contains(idDictionary) {
                // add item
                chosenDictionaries.append(idDictionary)
            } else {
                // delete item
                chosenDictionaries = chosenDictionaries.filter{$0 != idDictionary}
            }
            // save chosenDictionaries
            if let encodingData = try? JSONEncoder().encode(chosenDictionaries) {
                UserDefaults.standard.set(encodingData, forKey: "chosenDictionaries")
            }
        }
    }
}

struct ItemListSelectDictionaries_Previews: PreviewProvider {
    static var previews: some View {
        ItemListSelectDictionaries(chosenDictionaries: .constant([]), nameDictionary: "Dictionary", idDictionary: "1")
    }
}
