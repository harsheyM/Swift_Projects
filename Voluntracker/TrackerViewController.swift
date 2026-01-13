//
//  TrackerViewController.swift
//  Login
//
//  Created by Mahesh, Harshitha on 1/21/25.
//Ally, amaze

import UIKit

class TrackerViewController: UIViewController {

    var user = ""
    var goalHours = 0
    var currentHours = 0
    
    @IBOutlet var goalSetter: UILabel!
    @IBOutlet var goal: UITextField!
    @IBOutlet var userProgress: UILabel!
    @IBOutlet var goalUpdate: UILabel!
    @IBOutlet var congratsLabel: UILabel!
    @IBOutlet var addHour: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userProgress.isHidden = true
        goalUpdate.isHidden = true
        congratsLabel.isHidden = true
        addHour.isHidden = true
        
        //Uses an if-statement to see if the user needs to set the goal
        //If firstTime == true then it's already set up: this function sets up the user view
        if (UserDefaults.standard.bool(forKey: user + "firstTime") == true) {
            goal.isHidden = true
            goalSetter.isHidden = true
            labelUpdate()
        }
    }
    
    //Update the labels
    func labelUpdate() {
        userProgress.text = "\(user)'s Progress"
        userProgress.isHidden = false
        addHour.isHidden = false
        goalUpdate.text = "\(UserDefaults.standard.integer(forKey: user + "currentHours")) out of \(UserDefaults.standard.integer(forKey: user + "goalHours"))"
        goalUpdate.isHidden = false
    }
    
    //Sets up the goal if it's the user's first time setting up the account
    func firstTime() {
        if (UserDefaults.standard.bool(forKey: user + "firstTime")) == false {
            UserDefaults.standard.set(true, forKey: user + "firstTime")
            goal.isHidden = true
            goalSetter.isHidden = true
            labelUpdate()
            
        }
    }
    
    //Takes in what the goal amount is and only shows up if the account is being set up for the first time
    //Calls firstTime() after getting the goal amount
    @IBAction func goalGetter(_ sender: UITextField) {
        guard let goals = sender.text else { return }
        goalSetter.isHidden = false
        goalHours = Int(goals)!
        UserDefaults.standard.set(goalHours, forKey: user + "goalHours")
        firstTime()
        UserDefaults.standard.set(currentHours, forKey: user + "currentHours")
    }
    
    //Function needed to increase the hours the user volunteers, updates the label that shows the amount of hours
    //Uses a UserDefaults variable to make sure that the values remain saved. There's one for goalHours and one for currentHours
    @IBAction func addHours(_ sender: UIButton) {
        let current = UserDefaults.standard.integer(forKey: user + "currentHours")
        let goal = UserDefaults.standard.integer(forKey: user + "goalHours")
        
        if (current >= goal){
            userProgress.isHidden = true
            goalUpdate.isHidden = true
            addHour.isHidden = true
            congratsLabel.text = "You did it!! Congrats!!"
            congratsLabel.isHidden = false
            
        } else {
            currentHours = UserDefaults.standard.integer(forKey: user + "currentHours")
            UserDefaults.standard.set(currentHours + 1, forKey: user + "currentHours")
            goalUpdate.text = "\(UserDefaults.standard.integer(forKey: user + "currentHours")) out of \(UserDefaults.standard.integer(forKey: user + "goalHours"))"
        }
    }
    
}
