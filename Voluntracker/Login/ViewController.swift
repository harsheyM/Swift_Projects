//
//  ViewController.swift
//  Login
//
//  Created by Mahesh, Harshitha on 12/20/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var forgotPassword: UIButton!
    @IBOutlet var createAccount: UIButton!
    @IBOutlet var logIn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = "Voluntracker"
    }
    
    //Checks log in, if the user exists in the User Default, then the segue is called and the screen changes
    //Otherwise error messages show up and the user has to click off the alert and try a new password and username
    @IBAction func logIn(_ sender: UIButton) {
        guard let user = username.text else { return }
        guard let passwd = password.text else { return }
        
        if (passwd == UserDefaults.standard.string(forKey: user)!) {
                performSegue(withIdentifier: "Log In", sender: nil)
                
            }
        
        else {
            showAlertButtonTapped()
        }
        
    }
    
    func restart() {
        username.text = ""
        password.text = ""
    }
    
    func showAlertButtonTapped() {

            // create the alert
            let alert = UIAlertController(title: "Invalid Username or Password", message: "Please try again.", preferredStyle: UIAlertController.Style.alert)
        
            // add an action (button)
        let restartAction = UIAlertAction(title: "Okay", style: UIAlertAction.Style.default) { _ in self.restart()
            }
            alert.addAction(restartAction)

            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
    
    //Establishes what the navigation item looks like
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else {
            let vc = segue.destination as! TrackerViewController
            vc.user = username.text!
            segue.destination.navigationItem.title = "Hi, \(username.text!)"
            
            return
        }
        if sender == forgotPassword {    segue.destination.navigationItem.title = "Forgot Password"
        }
        else if sender == createAccount {    segue.destination.navigationItem.title = "Create New Account"
            print("create account")
        }
        
    }
}

