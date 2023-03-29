//
//  SettingsView.swift
//  palmcards
//
//  Created by Вадим Мартыненко on 21.03.2023.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var settings: Settings
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color("background")
                    .ignoresSafeArea()
                
                List {
                    Section("Игра") {
                        Toggle("Показывать сначала перевод", isOn: $settings.firstShowTranslate)
                    }
                }
            }
            .navigationTitle("Настройки")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(Settings())
    }
}
