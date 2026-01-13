//
//  ViewController.swift
//  IP08-Xylophone
//
//  Created by Mahesh, Harshitha on 10/15/24.
//

import UIKit
import AVFoundation

var keys = [0: "C", 1: "D", 2: "E", 3: "F", 4: "G", 5: "A", 6: "B"]
var player : AVAudioPlayer!
class ViewController: UIViewController {

    
    @IBOutlet var keyLetters: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func selectedKey(_ sender: UIButton) {
        let key : Int = sender.tag
        playSound(key)
    }
    func playSound(_ key : Int) {
        if let keyVal = keys[key] {
            let url = Bundle.main.url(forResource: keyVal, withExtension: "wav")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }

    }
}

