//
//  GameShared.swift
//  миллионер
//
//  Created by Elizaveta Sidorenkova
//

import Foundation
final class Game {
    
    static let shared = Game()
    
    private(set) var results: [Results] {
        didSet {
            resultCareTaker.save(results: self.results)
        }
    }
    private let resultCareTaker = ResultsCareTaker()
    
    
    private(set) var question: [Question] {
        didSet {
            questionCareTaker.save(questions: self.question)
        }
    }
    private var questionCareTaker = QuestionsCareTaker()
    
    private init() {
        self.results = self.resultCareTaker.retrieveResults()
        self.question = self.questionCareTaker.retrieveQuestions()
    }
    
    func addResults(_ results: Results) {
        self.results.append(results)
    }
    
    func clearResults() {
        self.results = []
    }
    
    
    func addQuestion(_ question: Question) {
        self.question.append(question)
    }
    
    func clearQuestion() {
        self.question = []
    }
    
    var gameSession: GameSession?
    
    var modeGame: Mode = .serially
}
