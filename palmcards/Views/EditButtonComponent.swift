//
//  EditButtonComponent.swift
//  palmcards
//
//  Created by Вадим Мартыненко on 21.03.2023.
//

import SwiftUI

struct EditButtonComponent: View {
    @Binding var editMode: EditMode
    
    var body: some View {
        Button {
            if editMode == .inactive {
                editMode = .active
            } else {
                editMode = .inactive
            }
        } label: {
            Text(editMode == .inactive ? "Редактировать" : "Готово")
                .foregroundColor(Color.red)
        }
    }
}

struct EditButtonComponent_Previews: PreviewProvider {
    static var previews: some View {
        EditButtonComponent(editMode: .constant(.inactive))
    }
}
