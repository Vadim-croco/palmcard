//
//  NoItemDictionaryView.swift
//  palmcards
//
//  Created by Вадим Мартыненко on 20.03.2023.
//

import SwiftUI

struct NoItemDictionaryView: View {
    @State var animateOpacity: Bool = false
    
    var body: some View {
        ZStack{
            Color("background")
                .ignoresSafeArea()
            
            ScrollView{
                VStack{
                    Text("У вас нет словарей")
                        .bold()
                        .font(.title)
                        .foregroundColor(.primary)
                    Text("Вы можете добавить их")
                        .foregroundColor(.secondary)
                        .padding(.bottom)
                    Spacer()
                }
                .opacity(animateOpacity ? 1 : 0)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.vertical)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
                withAnimation(.linear(duration: 1.5)){
                    animateOpacity = true
                }
            })
        }
    }
}

struct NoItemDictionaryView_Previews: PreviewProvider {
    static var previews: some View {
        NoItemDictionaryView()
    }
}
