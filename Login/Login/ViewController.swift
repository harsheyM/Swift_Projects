//
//  ViewController.swift
//  Login
//
//  Created by Mahesh, Harshitha on 12/20/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var forgotUsername: UIButton!
    @IBOutlet var username: UITextField!
    @IBOutlet var forgotPassword: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else { return }
        
        if sender == forgotPassword {
            segue.destination.navigationItem.title = "Forgot Password"
        } else if sender == forgotUsername {
            segue.destination.navigationItem.title = "Forgot Username"
        } else {
            segue.destination.navigationItem.title = username.text
        }
    }

    @IBAction func forgotUsernameOrPassword(_ sender: UIButton) {
        performSegue(withIdentifier: "General", sender: sender)
    }
    
}

