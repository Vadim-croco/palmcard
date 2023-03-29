//
//  WritingGameLogic.swift
//  palmcards
//
//  Created by Вадим Мартыненко on 03.04.2023.
//

import Foundation

class WritingGameLogic: ObservableObject {
    @Published var writingWord: String = ""
    @Published var showingTranslate: String = ""
    @Published var rightWord: String = ""
    @Published var shuffleWords: [WordsModel] = []
    @Published var countWords: Int = 0
    @Published var indexShuffleWords: Int = 0
    @Published var rightAnswers: Int = 0
    @Published var wrongAnswers: Int = 0
    @Published var showResults: Bool = false
    @Published var showingTranscription: String = ""
    
    var lastIndexElement = 0
    
    func startGame(listWords: [WordsModel]){
        setShuffledWords(listWords: listWords)
        countWords = listWords.count
        wrongAnswers = 0
        rightAnswers = 0
        showResults = false
        indexShuffleWords = 0
        writingWord = ""
        showingTranslate = shuffleWords[0].translate
        rightWord = shuffleWords[0].name
        showingTranscription = shuffleWords[0].transcription
        lastIndexElement = shuffleWords.count - 1
    }
    
    func endGame(){
        writingWord = ""
        countWords = 0
        wrongAnswers = 0
        rightAnswers = 0
        indexShuffleWords = 0
        shuffleWords = []
        showingTranslate = ""
        showingTranscription = ""
        rightWord = ""
    }
    
    func breakGame(){
        endGame()
        showResults = false
    }
    
    func setShuffledWords(listWords: [WordsModel]) {
        self.shuffleWords = listWords.shuffled()
    }
    
    func getPercentRightAnswers() -> CGFloat {
        return CGFloat(Double(rightAnswers) / Double(lastIndexElement + 1))
    }
    
    func pressNextButton() {
        if indexShuffleWords <= lastIndexElement  {
            rightAnswers += 1
        }
        if shuffleWords.count - 1 > indexShuffleWords {
            guessNextWord()
        }else{
            showResults = true
        }
    }
    
    func pressMissButton() {
        wrongAnswers += 1
        shuffleWords.append(shuffleWords[indexShuffleWords])
        countWords += 1
        if shuffleWords.count - 1 > indexShuffleWords {
            guessNextWord()
        }else{
            showResults = true
        }
    }
    
    func guessNextWord(){
        indexShuffleWords += 1
        writingWord = ""
        showingTranslate = shuffleWords[indexShuffleWords].translate
        rightWord = shuffleWords[indexShuffleWords].name
        showingTranscription = shuffleWords[indexShuffleWords].transcription
        countWords -= 1
    }
}
