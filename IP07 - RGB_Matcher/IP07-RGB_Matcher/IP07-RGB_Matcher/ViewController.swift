//
//  ViewController.swift
//  IP07-RGB_Matcher
//
//  Created by Mahesh, Harshitha on 10/3/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var goalColor: UILabel!
    @IBOutlet var myColor: UILabel!
    
    var timeStarts : Bool = false
    var timer = Timer()
    var totalTime = 10
    
    var score : Int = 0
    
    var ogRed : Double = 0
    var ogGreen : Double = 0
    var ogBlue : Double = 0
    
    var red : Float = 0
    var green : Float = 0
    var blue : Float = 0
    
    @IBOutlet var timeChange: UILabel!
    @IBOutlet var slides: [UISlider]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpNewColor()
        goalColor.layer.borderWidth = 2
        view.addSubview(goalColor)
        
        myColor.layer.borderWidth = 2
        view.addSubview(myColor)
    }
    
    func setUpNewColor() {
        ogRed = Double.random(in: 0..<1)
        ogGreen = Double.random(in: 0..<1)
        ogBlue = Double.random(in: 0..<1)
        goalColor.backgroundColor = UIColor(red: ogRed, green: ogGreen, blue: ogBlue, alpha: 1.0)
    }
    @IBAction func slidesMoved(_ sender: UISlider) {
        if !(timeStarts) {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
            timeStarts = true
        }
        if sender.tag == 0 {
            red = slides[sender.tag].value
        } else if sender.tag == 1 {
            green = slides[sender.tag].value
        } else if sender.tag == 2 {
            blue = slides[sender.tag].value
        }
        myColor.backgroundColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1.0)
    }
    
    @objc func updateTime() {
            timeChange.text = "\(totalTime)"

            if totalTime != 0 {
                totalTime -= 1
            } else {
                timerFunction()
            }
        }
    func timerFunction() {
        timer.invalidate()
        calculateScore()
        showAlertButtonTapped()
        
    }
    func calculateScore() {
        let rDiff : Double =  ogRed - Double(slides[0].value)
        let gDiff : Double = ogGreen - Double(slides[1].value)
        let bDiff : Double = ogBlue - Double(slides[2].value)
        let sqrRoot = sqrt(pow(rDiff, 2) + pow(gDiff, 2) + pow(bDiff, 2))
        score = Int(round((1 - sqrRoot) * 100))
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
        myColor.backgroundColor = .white
        slides[0].value = 1
        slides[1].value = 1
        slides[2].value = 1
        setUpNewColor()
        timeStarts = false
        timeChange.text = "10"
        totalTime = 10
    }

}

