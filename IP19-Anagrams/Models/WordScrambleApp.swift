//
//  WordScrambleApp.swift
//  IP19-Anagrams
//
//  Created by Mahesh, Harshitha on 4/16/25.
//

import Foundation
import SwiftUI

class WordScrambleApp : ObservableObject {
    @Published var found : [String] = []
    @Published var score : Int = 0
    @Published var word : String = ""
    
    var words : [String] = []
    
    init() {
        setUp()
    }
    
    func setUp() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                words = startWords.components(separatedBy: "\n")
            }
        }
        
        found = []
        score = 0
        
        words = words.shuffled()
        word = words.first!
        
        print(word)
    }
    
    func checkAnagram(wordCheck: String) -> Int {
        var value : Int = 0
        var i : Int = 0
        while (i < word.count) {
            let userIndex = word.index(word.startIndex, offsetBy: i)
            var k : Int = 0
            while (k < wordCheck.count) {
                if (word[userIndex] == wordCheck[wordCheck.index(wordCheck.startIndex, offsetBy: k)]) {
                    value += 1
                }
                k += 1
            }
            i += 1
        }
        if (value >= wordCheck.count) {
            found.append(wordCheck)
            return getScore(enteredWord: wordCheck)
        }
        else {
            print(value)
            print(wordCheck.count)
            return 0
        }
    }
    
    func getScore(enteredWord: String) -> Int {
        if (enteredWord.count >= 3 && enteredWord.count <= 5) {
            score += 1
            return 1
        }
        else if (enteredWord.count == 6) {
            score += 2
            return 2
        }
        else if (enteredWord.count == 7) {
            score += 3
            return 3
        }
        else if (enteredWord.count == 8) {
            score += 4
            return 4
        }
        return 0
    }
     
    
    func isreal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    
    
}
