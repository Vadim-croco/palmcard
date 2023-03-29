//
//  WritingPlayingView.swift
//  palmcards
//
//  Created by Вадим Мартыненко on 02.04.2023.
//

import SwiftUI

struct WritingPlayingView: View {
    let chosenDictionaries: [String]
    let listWords: [WordsModel]
    
    @EnvironmentObject var dictionaryViewModel: DictionaryViewModel
    @StateObject var gameLogic: WritingGameLogic = WritingGameLogic()
    @State var disableButtonNext: Bool = false
    @State var firstOpen: Bool = false
    @State var allButtonsDisabled: Bool = false
    @State var textColor: Color = Color.primary
    @State var percent: CGFloat = 0
    @State var showConfirmDialog: Bool = false
    @State var showTranscription: Bool = false
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack{
            if gameLogic.showResults {
                ResultsView
            } else {
                GameView
            }
        }
        .navigationBarBackButtonHidden(true)
        .confirmationDialog("Пропустить", isPresented: $showConfirmDialog, actions: {
            Button("Пропустить"){
                allButtonsDisabled = true
                gameLogic.writingWord = gameLogic.rightWord
                showTranscription = true

                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                    gameLogic.writingWord = ""
                    showTranscription = false
                    gameLogic.pressMissButton()
                    allButtonsDisabled = false
                })
            }
            
            Button("Отменить", role: .cancel){
                showConfirmDialog = false
            }
        })
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
                gameLogic.startGame(listWords: listWords)
                firstOpen = true
            }
        }
    }
    
    var GameView: some View {
        VStack{
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
                .padding(.horizontal)
                VStack{
                    Text(gameLogic.showingTranslate)
                        .font(.title2)
                    Text(gameLogic.writingWord)
                        .foregroundColor(textColor)
                        .font(.title)
                    Text(showTranscription ? gameLogic.showingTranscription : "")
                    
                }
                .padding(.horizontal)
            }
            Spacer()
            VStack {
                buttons
                PlayKeyBoard(text: $gameLogic.writingWord, disableButtonNext: $disableButtonNext, allButtonsDisabled: $allButtonsDisabled){
                    
                    disableButtonNext = true
                    
                    if gameLogic.writingWord.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == gameLogic.rightWord.lowercased() {
                        textColor = Color.green
                        showTranscription = true
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                            textColor = Color.primary
                            showTranscription = false
                            gameLogic.pressNextButton()
                        })
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                            disableButtonNext = false
                        })
                        
                    } else {
                        textColor = Color.red
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                            textColor = Color.primary
                            disableButtonNext = false
                        })
                    }
                }
            }
        }
    }
    
    var buttons: some View {
        HStack{
            Button(action: {
                showConfirmDialog = true
            }) {
                Text("пропустить")
                    .foregroundColor(Color.white)
                    .padding(10)
                    .background(allButtonsDisabled ? Color.gray : Color.orange)
                    .cornerRadius(15)
            }
            .disabled(allButtonsDisabled)
        }
        .padding()
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
}

struct WritingPlayingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            WritingPlayingView(chosenDictionaries: ["1"], listWords: [WordsModel(name: "asd", translate: "asd")])
                .environmentObject(DictionaryViewModel())
        }
    }
}
