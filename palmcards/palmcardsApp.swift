//
//  palmcardsApp.swift
//  palmcards
//
//  Created by Вадим Мартыненко on 20.03.2023.
//

import SwiftUI

@main
struct palmcardsApp: App {
    @StateObject var dictionaryViewModel: DictionaryViewModel = DictionaryViewModel()
    @StateObject var settings: Settings = Settings()
    
    var body: some Scene {
        WindowGroup{
            BottomTabsNavigator()
                .environmentObject(dictionaryViewModel)
                .environmentObject(settings)
                .navigationSplitViewStyle(AutomaticNavigationSplitViewStyle())
        }
    }
}
