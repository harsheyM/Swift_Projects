//
//  SoundViewController.swift
//  IP13-Captcha
//
//  Created by Mahesh, Harshitha on 3/4/25.
//

import UIKit
import AVFoundation

class SoundViewController: UIViewController {

    var sounds = [String]()
    var fullName = [String]()
    var answerIndex = 0
    var incorrectAns = 0
    
    var useIndex = 0
    
    var player : AVAudioPlayer!
    
    @IBOutlet var soundButtons: [CaptchaButton]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUp()
        setUpSounds()
    
    }
    
    func setUp() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            
            if item.hasSuffix(".wav") {
                fullName.append(item)
                let name = item.replacingOccurrences(of: ".wav", with: "")
                let nameArray = name.components(separatedBy: "_")
                sounds.append(nameArray[1])
            }
        }
    }
     
    
    func setUpSounds() {
        sounds.shuffle()
        var answer = ""
        if let a = sounds.first {
            answer = a
        }
        
        var soundsShow : [String] = [answer, sounds[1], sounds[2], sounds[3]]
        soundsShow.shuffle()
        
        var i = 0
        
        while (i < 4) {
            soundButtons[i].setTitle(soundsShow[i], for: .normal)
            if (soundsShow[i] == answer) {
                answerIndex = i
            }
            i += 1
        }
    }
    
    @IBAction func buttonPlay(_ sender: UIButton) {
        playSound(answerIndex)
    }
    
    
    func playSound(_ key : Int) {
        let keyVal = sounds[key]
        var index = 0
        for item in fullName {
            if (item.contains(keyVal)) {
                useIndex = index
            }
            index += 1
        }
        let url = Bundle.main.url(forResource: fullName[useIndex], withExtension: "")
        
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    @IBAction func soundButtonPressed(_ sender: CaptchaButton) {
        if sender.tag == answerIndex {
            performSegue(withIdentifier: "Finished", sender: nil)
        }
        else if incorrectAns == 1 {
            sender.shake()
            performSegue(withIdentifier: "Robot", sender: nil)
        }
        else {
            sender.shake()
            incorrectAns += 1
            setUp()
            setUpSounds()
        }
    }
    

}
