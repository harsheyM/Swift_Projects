//
//  ViewController.swift
//  IP10-AddOne
//
//  Created by Mahesh, Harshitha on 11/13/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var question: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var inputField: UITextField!
    
    var score = 0
    var timer = Timer()
    var timerStarted : Bool = false
    var totalTime = 10

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        
        //Set up numbers
        timeLabel.text = "00:10"
        randomNumbers()
        }
    
    @IBAction func timerStart(_ sender: UITextField) {
        if (timerStarted == false) {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
            timerStarted = true
        }
    }
    
    @IBAction func inputFromUser(_ sender: UITextField) {
        guard let entry : String = sender.text else { return }
        guard entry.count == 3 || entry.count == 4 else { return }
        checkAnswer(sender.text)
    }
    
    func randomNumbers() {
        var random : Int = Int.random(in: 1000..<9999)
        question.text = String(random)
    }
    
    func checkAnswer(_ input : String!) {
        var num : Int = Int(input)!
        guard let org : String = question.text else { return }
        var ogNum : Int = Int(org)!
        
        guard let checker : Int = Int(alg(ogNum)) else { return }
        
        if (checker == num) {
            score += 1
            scoreLabel.text = String(score)
        }
        else {
            score -= 1
            scoreLabel.text = String(score)
        }
        randomNumbers()
    }
    
    func alg(_ ogNum : Int) -> String {
        var reversed : String = ""
        var answer : String = ""
        var loop : Int = 4
        var variable : Int = ogNum
        
        while (loop != 0) {
            let term : Int = variable % 10
            if (term == 9) { reversed += "0" }
            else { reversed += String(term + 1) }
            variable = variable / 10
            loop -= 1
        }
        answer = String(reversed.reversed())
        return answer
    }
    
    @objc func updateTime() -> Void {
        totalTime = totalTime - 1
        if (totalTime < 0) {
            timer.invalidate()
            showAlertButtonTapped()
        }
        else {
            let time = secondsToMinutes(seconds: totalTime)
            let timeString = makeTimeString(minutes: time.0, seconds: time.1)
            timeLabel.text = timeString
        }

    }
    
    func secondsToMinutes(seconds: Int) -> (Int, Int) {
    return ((seconds / 60), (seconds % 60))
    }

    func makeTimeString(minutes: Int, seconds: Int) -> String {
    var timeString = ""
    timeString += String(format: "%02d", minutes)
    timeString += ":"
    timeString += String(format: "%02d", seconds)
    return timeString
    }
    
    func showAlertButtonTapped() {
        // create the alert
        let alert = UIAlertController(title: "Game Over!", message: "Score: \(score)", preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        let restartAction = UIAlertAction(title: "Click to Restart", style:  UIAlertAction.Style.default) { _ in self.restart()
        }
            alert.addAction(restartAction)

        // show the alert
        self.present(alert, animated: true, completion: nil)
        }
    
    func restart() {
        totalTime = 10
        timerStarted = false
        score = 0
        
        scoreLabel.text = "0"
        timeLabel.text = "00:10"
        inputField.text = ""
        
    }


}

