//
//  ViewController.swift
//  IP13-Captcha
//
//  Created by Mahesh, Harshitha on 2/24/25.
//

import UIKit

class ViewController: UIViewController {

    var pictures = [String]()
    var answerIndex = 0
    var incorrectAns = 0
    @IBOutlet var imageValue: UILabel!
    @IBOutlet var imageChoices: [CaptchaImageView]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUp()
        setUpImages()
    }
    
    func setUp() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix("png") {
                let name = item.replacingOccurrences(of: ".png", with: "")
                pictures.append(name)
            }
        }
    }

    func setUpImages() {
        pictures.shuffle()
        var answer = ""
        if let a = pictures.first {
            answer = a
        }
        imageValue.text = answer
        
        
        var picturesShow : [String] = [answer, pictures[1], pictures[2], pictures[3]]
        picturesShow.shuffle()
        
        var i = 0
        
        while (i < 4) {
            imageChoices[i].image = UIImage(named: picturesShow[i])
            if (picturesShow[i] == answer) {
                answerIndex = i
            }
            i += 1
        }
    }

    
    @IBAction func imageSelected(_ sender: UITapGestureRecognizer) {
        if sender.view?.tag == answerIndex {
            performSegue(withIdentifier: "SoundCaptcha", sender: nil)
        }
        else if incorrectAns == 1 {
            imageChoices[sender.view!.tag].shake()
            performSegue(withIdentifier: "Robot", sender: nil)
        }
        else {
            imageChoices[sender.view!.tag].shake()
            incorrectAns += 1
            setUp()
            setUpImages()
        }
        
    }
    
    
}

