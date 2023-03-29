//
//  NoItemWordsWithoutScrollView.swift
//  palmcards
//
//  Created by Вадим Мартыненко on 29.03.2023.
//

import SwiftUI

struct NoItemWordsWithoutScrollView: View {
    @State var animateOpacity: Bool = false
    
    var body: some View {
        ZStack{
            Color("background")
                .ignoresSafeArea()
            
                VStack{
                    Text("У вас нет слов")
                        .bold()
                        .font(.title)
                        .foregroundColor(.primary)
                    Text("Вы можете добавить их")
                        .foregroundColor(.secondary)
                        .padding(.bottom)
                }
               // .padding(.vertical)
                .opacity(animateOpacity ? 1 : 0)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 110)
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
                withAnimation(.linear(duration: 1)){
                    animateOpacity = true
                }
            })
        }
    }
}

struct NoItemWordsWithoutScrollView_Previews: PreviewProvider {
    static var previews: some View {
        NoItemWordsWithoutScrollView()
    }
}
