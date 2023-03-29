//
//  GameLogic.swift
//  palmcards
//
//  Created by Вадим Мартыненко on 24.03.2023.
//

import Foundation

class GameLogic: ObservableObject {
    @Published var shuffleWords: [WordsModel] = []
    @Published var countWords: Int = 0
    @Published var indexShuffleWords: Int = 0
    @Published var showTitle: String = ""
    @Published var showUpTitle: String = ""
    @Published var showDownTitle: String = ""
    @Published var rightAnswers: Int = 0
    @Published var wrongAnswers: Int = 0
    @Published var showResults: Bool = false
    @Published var firstShowTranslate: Bool = false
    
    var lastIndexElement = 0
    
    enum GuessMoment {
        case rotate
        case select
    }
    
    @Published var guessMoment: GuessMoment = .rotate
    
    func startGame(shuffledWords: [WordsModel], setFirstShowTranslate: Bool){
        firstShowTranslate = setFirstShowTranslate
        setSHuffleWords(shuffledWords: shuffledWords)
        countWords = shuffledWords.count
        wrongAnswers = 0
        rightAnswers = 0
        showResults = false
        indexShuffleWords = 0
        showTitle = firstShowTranslate ? shuffleWords[0].translate : shuffleWords[0].name
        showUpTitle = firstShowTranslate ? shuffleWords[0].translateExamples : shuffleWords[0].examples
        showDownTitle = firstShowTranslate ? "" : shuffleWords[0].transcription
        lastIndexElement = shuffleWords.count - 1
    }
    
    func endGame() {
        shuffleWords = []
        countWords = 0
        indexShuffleWords = 0
        showTitle = ""
        showUpTitle = ""
        showDownTitle = ""
        rightAnswers = 0
        wrongAnswers = 0
    }
    
    func breakGame() {
        shuffleWords = []
        countWords = 0
        indexShuffleWords = 0
        showTitle = ""
        showUpTitle = ""
        showDownTitle = ""
        showResults = false
        rightAnswers = 0
        wrongAnswers = 0
    }
    
    func getPercentRightAnswers() -> CGFloat {
        return CGFloat(Double(rightAnswers) / Double(lastIndexElement + 1))
    }
    
    func setShowTitleOnAnother() {
        showTitle = firstShowTranslate ? shuffleWords[indexShuffleWords].name : shuffleWords[indexShuffleWords].translate
        showUpTitle = firstShowTranslate ? shuffleWords[indexShuffleWords].examples : shuffleWords[indexShuffleWords].translateExamples
        showDownTitle = firstShowTranslate ? shuffleWords[indexShuffleWords].transcription : ""
    }
    
    func pressNextButton() {
        setShowTitleOnAnother()
    }
    
    func pressCheckMarkButton() {
        if indexShuffleWords <= lastIndexElement  {
            rightAnswers += 1
        }
        if shuffleWords.count - 1 > indexShuffleWords {
            indexShuffleWords += 1
            showTitle = firstShowTranslate ? shuffleWords[indexShuffleWords].translate : shuffleWords[indexShuffleWords].name
            showUpTitle = firstShowTranslate ? shuffleWords[indexShuffleWords].translateExamples : shuffleWords[indexShuffleWords].examples
            showDownTitle = firstShowTranslate ? "" : shuffleWords[indexShuffleWords].transcription
            countWords -= 1
        }else{
            showResults = true
        }
    }
    
    func pressXmarkButton() {
        wrongAnswers += 1
        shuffleWords.append(shuffleWords[indexShuffleWords])
        countWords += 1
        if shuffleWords.count - 1 > indexShuffleWords {
            indexShuffleWords += 1
            showTitle = firstShowTranslate ? shuffleWords[indexShuffleWords].translate : shuffleWords[indexShuffleWords].name
            showUpTitle = firstShowTranslate ? shuffleWords[indexShuffleWords].translateExamples : shuffleWords[indexShuffleWords].examples
            showDownTitle = firstShowTranslate ? "" : shuffleWords[indexShuffleWords].transcription
            countWords -= 1
        }else{
            showResults = true
        }
    }
    
    func setSHuffleWords(shuffledWords: [WordsModel]) {
        shuffleWords = shuffledWords.shuffled()
    }
    
    func toggleGuessMoment() {
        if guessMoment == .select {
            guessMoment = .rotate
        } else {
            guessMoment = .select
        }
    }
}
