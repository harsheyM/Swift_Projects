//
//  CreateAccountViewController.swift
//  Login
//
//  Created by Mahesh, Harshitha on 1/8/25.
//

import UIKit

class CreateAccountViewController: UIViewController {

    var username : String = ""
    var password : String = ""
    
    @IBOutlet var chooseLabel: UILabel!
    @IBOutlet var passwordButton: UITextField!
    @IBOutlet var status: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chooseLabel.isHidden = true
        passwordButton.isHidden = true
        status.text = ""
        // Do any additional setup after loading the view.
        
    }
    
    //Creates a User defaults variable depending on what the user enters in the username field
    //If the username already exists then it forces the user to choose another username
    @IBAction func userNameCreation(_ sender: UITextField) {
        status.text = ""
        if let user = sender.text {
            if (UserDefaults.standard.string(forKey: user) != nil) {
                status.text = "Choose another username"
                
            } else {
                username = user
                chooseLabel.isHidden = false
                passwordButton.isHidden = false
            }
        }
    }
    
    @IBAction func passwordCreation(_ sender: UITextField) {
        if let pass = sender.text {
            password = pass
        }
        setUpAccount()
    }
    
    func setUpAccount() {
        UserDefaults.standard.set(password, forKey: username)
        status.text = "Account Created!"
    }
    
    

}
