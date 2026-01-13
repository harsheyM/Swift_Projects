//
//  GameViewController.swift
//  IP12-Trivia
//
//  Created by Mahesh, Harshitha on 2/4/25.
//

import UIKit

class GameViewController: UIViewController {

    var numOfQ = 0
    var ques = 0
    var num : Double = 0
    var turn : Double = 0
    var curr = 0
    var answeredRight = 0
    
    var corAns = ""
    var corAnsIndex = 0
    var firstTime = true
    
    var category = ""
    var game : [Trivia] = []
    var values = TriviaGame.getQuestionDB()
    
    
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var trivaQ: UILabel!
    @IBOutlet var answerChoices: [UIButton]!
    
    
    override func viewWillAppear(_ animated: Bool) {
        let vc = tabBarController!.viewControllers![0]
        if (firstTime) {
            reset()
            if let ogVC = vc as? ChooseViewController {
                numOfQ = ogVC.questions
                num = Double(numOfQ)
                ques = ogVC.questions
                category = ogVC.category
                
                if let q = values[category] {
                    game = q
                }
            }
            firstTime = false
        }
        playGame()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        if sender.currentTitle == corAns {
            UIView.animate(withDuration: 1, animations: {
                    sender.backgroundColor = .green
                }, completion: { _ in
                    self.answeredRight += 1
                    self.playGame()
                    
                })
        }
        else {
            UIView.animate(withDuration: 1, animations: {
                    sender.backgroundColor = .red
                    self.answerChoices[self.corAnsIndex].backgroundColor = .green
                }, completion: { _ in
                    
                    self.playGame()
                })
        }
        
    }
    
    func playGame() {
        var i = 0
        while (i < 4){
            answerChoices[i].backgroundColor = .systemBlue
            i += 1
        }
        
        let percentProgress = Float(turn/num)
        progressBar.setProgress(Float(percentProgress), animated: true)
        
        
        if (numOfQ != 0) {
            setUpTrivia()
            numOfQ -= 1
            turn += 1
        }
        else {
            firstTime = true
            performSegue(withIdentifier: "End Screen", sender: nil)
        }
    }
    
    func setUpTrivia() { 
        setUpQuestion(0)
        checkAnswer(0)
        game.removeFirst()
    }
    
    func setUpQuestion(_ index : Int) {
        trivaQ.text = game[index].getQuestion()
        
    }
    
    func checkAnswer(_ index : Int) {
        
        let randomInt = Int.random(in: 0..<4)
        
        var i : Int = 0
        var wrongAnswers : Array<String> = game[index].getIncorrectAnswers().shuffled()
        
        while i < 4 {
            if (i == randomInt) {
                answerChoices[i].setTitle(game[index].getCorrectAnswer(), for: .normal)
                corAns = game[index].getCorrectAnswer()
                corAnsIndex = i
            }
            else {
                let wrong = wrongAnswers.remove(at: 0)
                answerChoices[i].setTitle(wrong, for: .normal)
            }
            i += 1
        }
    }
        func reset() {
            numOfQ = 0
            num = 0
            turn = 0
            curr = 0
            answeredRight = 0
            corAns = ""
            corAnsIndex = 0
            firstTime = true
            
            category = ""
            game = []
            
            
        }
         
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard sender is UIButton else {
            let vc = segue.destination as! EndViewController
            vc.numOfQuestions = ques
            vc.correct = answeredRight
            
            return
        }
        
    }
         
    
}
