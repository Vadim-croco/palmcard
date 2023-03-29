//
//  BottomTabsNavigator.swift
//  palmcards
//
//  Created by Вадим Мартыненко on 20.03.2023.
//

import SwiftUI

struct BottomTabsNavigator: View {
    @State var selectView: Int = 0
    
    var body: some View {
        ZStack{
            Color("background")
                .edgesIgnoringSafeArea(.all)
            TabView(selection: $selectView) {
                DictionaryView()
                    .tabItem {
                        HStack {
                            Image(systemName: "book.fill")
                            Text("Словари")
                        }
                    }
                    .tag(0)
                
                PlayView()
                    .tabItem {
                        HStack{
                            Image(systemName: "play.circle.fill")
                            Text("Играть")
                        }
                    }
                    .tag(1)
                
                SettingsView()
                    .tabItem {
                        HStack {
                            Image(systemName: "gear")
                            Text("Настройки")
                        }
                    }
                    .tag(2)
            }
            .tint(Color.red)
        }
    }
}

struct BottomTabsNavigator_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabsNavigator()
            .environmentObject(DictionaryViewModel())
            .environmentObject(Settings())
    }
}
