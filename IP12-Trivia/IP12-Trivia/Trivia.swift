//
//  Trivia.swift
//  IP12-Trivia
//
//  Created by Mahesh, Harshitha on 1/31/25.
//

import Foundation
struct Trivia {
    var q : String
    var correct : String
    var incorrect : Array<String>
    
    init(q: String, correct: String, incorrect: Array<String>) {
        self.q = q
        self.correct = correct
        self.incorrect = incorrect
    }
    
    func getQuestion() -> String {
        return q
    }
    
    func getCorrectAnswer() -> String {
        return correct
    }
    
    func getIncorrectAnswers() -> Array<String> {
        return incorrect
    }
}
