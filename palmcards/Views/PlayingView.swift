//
//  PlayingView.swift
//  palmcards
//
//  Created by Вадим Мартыненко on 22.03.2023.
//

import SwiftUI

struct PlayingView: View {
    let chosenDictionaries: [String]
    let listWords: [WordsModel]
    @EnvironmentObject var dictionaryViewModel: DictionaryViewModel
    @EnvironmentObject var settings: Settings
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme
    @State var animate: Double = 0
    @State var disableButtons: Bool = false
    @State var firstOpen: Bool = false
    @State var percent: CGFloat = 0
    @StateObject var gameLogic: GameLogic = GameLogic()
    
    var body: some View {
        ZStack{
            Color("background")
                .ignoresSafeArea()
            
            if !gameLogic.showResults { 
                GameView
            } else {
                ResultsView
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .onAppear{
            var haveTheSameId: Bool = true
            chosenDictionaries.forEach { item in
                if !dictionaryViewModel.dictionaries.contains(where: {$0.id == item})
                {
                    haveTheSameId = false
                }
            }
            if !haveTheSameId {
                gameLogic.breakGame()
                dismiss()
            } else if !firstOpen{
                gameLogic.startGame(shuffledWords: listWords, setFirstShowTranslate: settings.firstShowTranslate)
                firstOpen = true
            }
        }
    }
    
    var ResultsView: some View {
        VStack {
            ZStack{
                Text("\(Int(percent * 100))%")
                Circle()
                    .stroke(.red, lineWidth: 20)
                
                Circle()
                    .trim(from: 0, to: percent)
                    .stroke(.green, lineWidth: 20)
                    .rotationEffect(.degrees(-90))
                    .animation(.linear(duration: 1), value: percent)
            }
            .padding()
            .padding(.horizontal, 50)
            
            VStack(alignment: .leading){
                HStack{
                    Text("Правильно угадано: \(gameLogic.rightAnswers)")
                        .foregroundColor(Color.green)
                    Spacer()
                }
                Text("Неправильно угадано: \(gameLogic.wrongAnswers)")
                    .foregroundColor(Color.red)
            }
            .frame(maxWidth: .infinity)
            .font(.title2)
            .padding()
            
            Spacer()
            
            Button(action: {
                dismiss()
                gameLogic.endGame()
            }, label: {
                Text("Закрыть")
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding()
            })
        }
        .onAppear{
            percent = gameLogic.getPercentRightAnswers()
        }
    }
    
    var GameView: some View {
        VStack{
            HStack{
                Button(action: {
                    dismiss()
                }, label: {
                    Text("Завершить")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .padding(10)
                        .background(colorScheme == .dark ? Color.white.opacity(0.2) : Color.black)
                        .cornerRadius(5)
                })
                Spacer()
                Text("\(gameLogic.countWords)")
            }
            .padding()
            Spacer()
            
            RoundedRectangle(cornerRadius: 15)
                .fill(colorScheme == .dark ? Color.white.opacity(0.2) : Color.white)
                .overlay(
                   // Text(gameLogic.showTitle)
                    VStack{
                        Text(gameLogic.showUpTitle)
                        Spacer()
                        Text(gameLogic.showTitle)
                            .font(.title)
                        Spacer()
                        Text(gameLogic.showDownTitle)
                    }
                        .padding(.vertical)
                )
                .frame(maxWidth: .infinity)
                .frame(height: 300)
                .padding(.horizontal)
                .rotation3DEffect(.degrees(animate), axis: (0, 1, 0))
            Spacer()
            if gameLogic.guessMoment == .rotate {
                nextButton
            } else {
                xmarkAndCheckmarkButtons
            }
        }
    }
    
    // buttons
    
    var nextButton: some View {
        HStack{
            Button(action: {
                animateRotateButton()
            }, label: {
                Text("Повернуть")
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(disableButtons ? Color.gray.opacity(0.2) : Color.blue)
                    .cornerRadius(5)
            })
            .disabled(disableButtons)
        }
        .padding()
    }
    
    var xmarkAndCheckmarkButtons: some View {
        HStack(spacing: 50){
            Button(action: {
                animateXmark()
            }, label: {
                Image(systemName: "xmark")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.horizontal, 30)
                    .frame(height: 55)
                    .background(disableButtons ? Color.gray.opacity(0.2) : Color.red)
                    .cornerRadius(10)
            })
            .disabled(disableButtons)
            
            Button(action: {
                animateCheckMark()
            }, label: {
                Image(systemName: "checkmark")
                    .font(.title)
                    .foregroundColor(Color.white)
                    .padding(.horizontal, 30)
                    .frame(height: 55)
                    .background(disableButtons ? Color.gray.opacity(0.2) : Color.green)
                    .cornerRadius(10)
            })
            .disabled(disableButtons)
        }
        .padding()
    }
    
    // logic xmark and checkmark
    
    func animateRotateButton() {
        gameLogic.toggleGuessMoment()
        disableButtons = true
        withAnimation(.linear(duration: 0.2)){
            animate = -90
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute:
        {
            animate = 90
            gameLogic.pressNextButton()
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.21, execute:
        {
            withAnimation(.linear(duration: 0.2)){
                animate = 0
            }
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.41, execute: {
            disableButtons = false
        })
    }
    
    func animateXmark() {
        gameLogic.toggleGuessMoment()
        gameLogic.pressXmarkButton()
    }
    
    func animateCheckMark() {
        gameLogic.toggleGuessMoment()
        gameLogic.pressCheckMarkButton()
    }
}

struct PlayingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            PlayingView(chosenDictionaries: ["1"], listWords: [WordsModel(name: "ura", translate: "dhit", examples: "adfs")])
                .environmentObject(DictionaryViewModel())
                .environmentObject(Settings())
        }
    }
}
