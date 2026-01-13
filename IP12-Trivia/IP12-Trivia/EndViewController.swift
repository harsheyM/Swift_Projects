//
//  EndViewController.swift
//  IP12-Trivia
//
//  Created by Mahesh, Harshitha on 2/4/25.
//

import UIKit

class EndViewController: UIViewController {

    var numOfQuestions = 0
    var correct = 0
    
    @IBOutlet var status: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        status.text = "You got \(correct) out of \(numOfQuestions)"
    }
    
    


}
