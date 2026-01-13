//
//  ViewController.swift
//  IP05-TicTacToe
//
//  Created by Mahesh, Harshitha on 9/24/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var boardButtons: [UIButton]!
    
    @IBOutlet var restart: UIButton!
    @IBOutlet var gameStatus: UILabel!
    
    var game = TicTacToe()
    override func viewDidLoad() {
        super.viewDidLoad()
        gameStatus.textColor = .white
        restart.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func boardButtonsPressed(_ sender: UIButton) {
        let spaceOpen : Bool = game.addPlay(value: sender.tag)
        let capacity : Bool = game.capacity()
        let tempArray : [String] = game.getBoard()

        if spaceOpen && capacity {
            boardButtons[sender.tag].setTitle(tempArray[sender.tag], for: .normal)
            gameStatus.textColor = .white
            game.player.toggle()
            if (game.checkWin()) {
                gameOver()
            }
        }
        else if capacity && !spaceOpen {
            gameStatus.text = "Choose an empty space!"
            gameStatus.textColor = .black
        }
        else if !capacity {
            boardButtons[sender.tag].setTitle(tempArray[sender.tag], for: .normal)
            gameOver()
        }
    }
    
    func gameOver() {
        gameStatus.text = "Game over!"
        gameStatus.textColor = .black
        restart.isHidden = false
    }
    @IBAction func restartGame(_ sender: UIButton) {
        game.reset()
        for index in 0...8 {
            boardButtons[index].setTitle("", for: .normal)
        }
        gameStatus.textColor = .white
        game.player = true
        restart.isHidden = true
    }
    
    
    
}


