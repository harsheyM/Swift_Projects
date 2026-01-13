//
//  Wordle.swift
//  IP14-Wordle
//
//  Created by Mahesh, Harshitha on 3/7/25.
//

import Foundation

class Wordle {
    
    let NUM_OF_TURNS = 6
    
    var guess = 0
    //The turn the user is on
    
    var currentWord = ""
    //Random word chosen that the user is trying to find
    
    var guesses = [String]()
    //Words that can be guessed from text file
    
    var possibleChoices = [String]()
    //Words that user finds from text file
    
    //Sets up the future word and the arrays that contain the possible words that users can guess
    func setUp() {
        guess = 0
        
        if let startWordsURL = Bundle.main.url(forResource: "wordle-La", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                possibleChoices = startWords.components(separatedBy: "\n")
            }
        }
        
        possibleChoices = possibleChoices.shuffled()
        currentWord = possibleChoices.first!
        
    
        if let startWordsURL = Bundle.main.url(forResource: "wordle-Ta", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                guesses = startWords.components(separatedBy: "\n")
            }
        }
        print(currentWord)
    }
    
    //Used to see if the user-given word exists
    func wordExists(_ userEnter : String) -> Bool {
        var i = guesses.count - 1
        var found = false
        //Checking if the user-given word is a 'real' word
        while (i >= 0) {
            if (guesses[i] == userEnter) {
                found = true
            }
            i -= 1
        }
        
        //Checking if the user-given word is a real, but 'checking' word
        i = possibleChoices.count - 1
        while (i >= 0) {
            if (possibleChoices[i] == userEnter) {
                found = true
            }
            i -= 1
        }
        return found
    }
    
    //Used to see what letters are in the word
    func checkLetters(_ userEnter: String, _ tag: Int) -> LetterTile {
        let tile = LetterTile()
        
        let userIndex = userEnter.index(userEnter.startIndex, offsetBy: tag, limitedBy: userEnter.endIndex)
        let realIndex = currentWord.index(currentWord.startIndex, offsetBy: tag, limitedBy: currentWord.endIndex)!
        
        tile.letter = String(userEnter[userIndex!])
        tile.status = "Not Found"
        
        var i = 0
        while (i < userEnter.count) {
            if (userEnter[userIndex!] == currentWord[currentWord.index(currentWord.startIndex, offsetBy: i)]) {
                tile.status = "Found"
            }
            i += 1
        }
        
        if (userEnter[userIndex!] == currentWord[realIndex]) {
            tile.status = "Exact"
        }
        
        return tile
    }
    
    //Organize all the dead letters and make sure there are no duplicates
    func deadLetters(_ userEnter : String) -> String {
        var dead = ""
        var seen = Set<Character>()
        var newDead = ""
        
        for char in userEnter {
            if !seen.contains(char) {
                seen.insert(char)
                dead.append(char)
                newDead += String(char) + " "
            }
        }
        return newDead
    }
}
