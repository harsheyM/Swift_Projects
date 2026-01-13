//
//  ViewController.swift
//  IP04-Magic8Ball
//
//  Created by Mahesh, Harshitha on 9/18/24.
//

import UIKit

class ViewController: UIViewController {

    var timer = Timer()
    var label : String = "Think of a question...and shake phone for answer"
    @IBOutlet var labelText: UILabel!
    var eightBallAnswer : [String] = ["Without a doubt", "Very doubtful", "Don't count on it", "Concentrate and ask again", "Better not tell you know", "Yes", "My reply is no", "Don't count on it"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .black
        labelText.text = label
        labelText.textColor = .white
        timer = Timer.scheduledTimer(timeInterval: 7, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if (motion == .motionShake && labelText.text == label) {
            eightBall()
        }
    }
    
    func eightBall() {
        var randomIndex = Int.random(in: 0..<eightBallAnswer.count - 1)
        labelText.text = "\(eightBallAnswer[randomIndex])"
        labelText.textColor = .white
    }
    
    @objc func timerFunction() {
        labelText.textColor = .white
        labelText.text = label
    }

}

