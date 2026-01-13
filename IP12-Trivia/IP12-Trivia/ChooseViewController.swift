//
//  ViewController.swift
//  IP12-Trivia
//
//  Created by Mahesh, Harshitha on 1/31/25.
//

import UIKit

class ChooseViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    @IBOutlet var pickers: [UIPickerView]!
    @IBOutlet var questionsLabel: UILabel!
    
    var play = UITabBarItem()
    
    var categories : Dictionary<String, [Trivia]> = TriviaGame.getQuestionDB()
    var queNum : [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    var keys: [String] = Array(TriviaGame.getQuestionDB().keys)
    var category : String = ""
    var questions : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        chooseStuff()

    }
    
    func chooseStuff() {
        pickers[0].selectRow(0, inComponent: 0, animated: false)
        pickers[1].selectRow(0, inComponent: 0, animated: false)
        
        pickers[0].delegate = self
        pickers[0].dataSource = self
        
        pickers[1].delegate = self
        pickers[1].dataSource = self
        
        pickers[1].isUserInteractionEnabled = false
        pickers[1].setValue(UIColor.lightGray, forKey: "textColor")
        questionsLabel.textColor = UIColor.lightGray
        
        let tabBarControllerItems = self.tabBarController?.tabBar.items
        if let tabArray = tabBarControllerItems {
            play = tabArray[1]
            play.isEnabled = false
        }
    }
    

    func numberOfComponents(in category: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ category: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (category == pickers[0]) {
            return categories.keys.count
        }
        else {
            return 10
        }
    }
    
    func pickerView(_ category: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (category == pickers[0]) {
            return keys[row]
        }
        else {
            return queNum[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView == pickers[0]) {
            category = keys[row]
            pickers[1].isUserInteractionEnabled = true
            pickers[1].setValue(UIColor.black, forKey: "textColor")
            questionsLabel.textColor = UIColor.black
        }
        if (pickerView == pickers[1]) {
            questions = Int(queNum[row])!
            play.isEnabled = true
        }
        
    }
    
    
    
    @IBAction func unwindToQuestions(unwindSegue: UIStoryboardSegue) {
    }

}

