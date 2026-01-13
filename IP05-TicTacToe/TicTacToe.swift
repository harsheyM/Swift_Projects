//
//  TicTacToe.swift
//  IP05-TicTacToe
//
//  Created by Mahesh, Harshitha on 9/24/24.
//

import Foundation
class TicTacToe {
    var board : [String] = ["", "", "", "", "", "", "", "", ""]
    var player : Bool = true
    //Player X = true & Player O = false
    
    func capacity() -> Bool {
        var cap : Int = 0
        for index in 0...8 {
            if board[index] != "" {
                cap += 1
            }
        }
        if cap == 9 {
            return false
        }
        return true
    }
    
    func reset() {
        for index in 0...8 {
           board[index] = ""
        }
    }
    func checkWin() -> Bool {
        //Check horizontal wins
        for index in 0...6 {
            if (board[index] == "X" && board[index + 1] == "X" && board[index + 2] == "X") {
                return true
            }
            else if (board[index] == "O" && board[index + 1] == "O" && board[index + 1] == "O" && board[index + 2] == "O") {
                return true
            }
        }
        //Check vertical wins
        for index in 0...2 {
            if (board[index] == "X" && board[index + 3] == "X" && board[index + 6] == "X") {
                return true
            }
            else if (board[index] == "O" && board[index + 3] == "O" && board[index + 6] == "O") {
                return true
            }
        }
        //Check right diagonal wins
        if (board[0] == "X" && board[4] == "X" && board[8] == "X") {
            return true
        }
        else if (board[0] == "O" && board[4] == "O" && board[8] == "O") {
            return true
        }
        //Check left diagonal wins
        if (board[2] == "X" && board[4] == "X" && board[6] == "X") {
            return true
        }
        else if (board[2] == "O" && board[4] == "O" && board[6] == "O") {
            return true
        }
        return false;
    }
    func addPlay(value: Int) -> Bool {
        if (board[value] == "") {
            if player == true {
                board[value] = "X"
            }
            else {
                board[value] = "O"
            }
            return true
        }
        else {
            print("Choose an empty space!")
            return false
        }
    }
    
    func getBoard() -> [String] {
        return board
    }
}
