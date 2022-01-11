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
    
    
    private init() {
        self.results = self.resultCareTaker.retrieveResults()
    }
    
    func addResults(_ results: Results) {
        self.results.append(results)
    }
    
    func clearResults() {
        self.results = []
    }
    
    
    var gameSession: GameSession?
    
    
}
