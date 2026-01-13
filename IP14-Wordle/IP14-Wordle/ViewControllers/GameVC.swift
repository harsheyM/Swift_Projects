//
//  GameVC.swift
//  IP14-Wordle
//
//  Created by Mahesh, Harshitha on 3/7/25.
//

import UIKit

class GameVC: UIViewController {

    var model = Wordle()
    var number = 0
    
    @IBOutlet var deadLetters: UILabel!
    @IBOutlet var textField: UITextField!
    @IBOutlet var boardOfTiles: [LetterTile]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restart()
        
    }
    
    //this is the function that is called when text is entered -> calls functions in Wordle() in order to check and update the game
    @IBAction func enterWord(_ sender: TextView) {
        model.guess += 1
        
        if (sender.text!.count != 5) {
            sender.shake()
            model.guess -= 1
        }
        if !(model.wordExists(sender.text!)) {
            sender.shake()
        }
        else {
            var checker = 0
            var i = 0
            while (i < 5) {
                let rando = model.checkLetters(sender.text!, i)
                checker += updateLabels(rando, number)
                i += 1
                number += 1
            }
            if (checker == 5) {
                winGame()
            }
            if (model.guess == model.NUM_OF_TURNS) {
                lostGame()
            }
            
        }
    }
    
    //Updates the tiles with the letter and the color that matches its status
    func updateLabels(_ available : LetterTile, _ tag: Int) -> Int {
        boardOfTiles[tag].text = available.letter
        if (available.status == "Not Found") {
            boardOfTiles[tag].backgroundColor = .darkGray
            
            let deads = "\(deadLetters.text!) \(available.letter)"
            deadLetters.text! = model.deadLetters(deads)  
            return 0
        }
        else if (available.status == "Exact") {
            boardOfTiles[tag].backgroundColor = .green
            return 1
        }
        else if (available.status == "Found") {
            boardOfTiles[tag].backgroundColor = .yellow
            return 0
        }
        return 0
    }
    
    //Alert that appears when the user finds the correct word
    func winGame() {
        // create the alert
        let alert = UIAlertController(title: "You won!", message: "Congrats!", preferredStyle: UIAlertController.Style.alert)
    
        // add an action (button)
        let restartAction = UIAlertAction(title: "Click to Restart", style:  UIAlertAction.Style.default) { _ in self.restart()
        }
        alert.addAction(restartAction)

        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    //Alert that appears when all turns are up
    func lostGame() {
        // create the alert
        let alert = UIAlertController(title: "You lost!", message: "The word was \(model.currentWord). Better luck next time!", preferredStyle: UIAlertController.Style.alert)
    
        // add an action (button)
        let restartAction = UIAlertAction(title: "Click to Restart", style:  UIAlertAction.Style.default) { _ in self.restart()
        }
        alert.addAction(restartAction)

        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    //Resets the board and generates new word to find
    func restart() {
        var i = 0
        while (i < boardOfTiles.count) {
            boardOfTiles[i].backgroundColor = .gray
            boardOfTiles[i].status = ""
            boardOfTiles[i].letter = ""
            boardOfTiles[i].text = " "
            i += 1
        }
        deadLetters.text = ""
        number = 0
        model.setUp()
    }

}
