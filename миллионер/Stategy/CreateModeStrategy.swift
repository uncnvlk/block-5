//
//  CreateModeStrategy.swift
//  миллионер
//
//  Created by Elizaveta Sidorenkova on 10.01.2022.
//

import Foundation

protocol CreateQuestionsStrategy {
    func createQuestions() -> [Question]
}

final class RandomStrategy: CreateQuestionsStrategy {
    func createQuestions() -> [Question] {
        var question = Game.shared.question
        question.shuffle()
        return question
    }
}

final class SeriallyStrategy: CreateQuestionsStrategy {
    func createQuestions() -> [Question] {
        var question = Game.shared.question
        return question
    }
}




