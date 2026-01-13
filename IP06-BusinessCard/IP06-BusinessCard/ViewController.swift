//
//  ViewController.swift
//  IP06-BusinessCard
//
//  Created by Mahesh, Harshitha on 9/30/24.
//

import UIKit

class ViewController: UIViewController {

    var screenWidth = 0
    var screenHeight = 0
   
    var photo = UIImage(named: "Harshey")
    var school = UILabel()
    var emailAdd = UILabel()
    var name = UILabel()
    var click = UIButton()
    var showing : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .magenta
        let screenBounds: CGRect = UIScreen.main.bounds
        screenWidth  = Int(screenBounds.width)
        screenHeight = Int(screenBounds.height)
        
        //Create click Button
        click.frame = CGRect(x: 0, y: 10 + screenHeight/2, width: screenWidth, height: 50)
        click.addTarget(self, action: #selector(selected(_:)), for: .touchUpInside)
        click.setTitleColor(.black, for: .normal)
        click.setTitle("Tap to show contact info", for: .normal)
        view.addSubview(click)
        
        //Create name label
        name.frame = CGRect(x: 0, y: screenHeight/2 - 80, width: screenWidth, height: 50)
        name.text = "Harshitha Mahesh"
        name.font = name.font.withSize(30)
        name.textAlignment = NSTextAlignment(.center)
        view.addSubview(name)
        
        //Create photo
        var image = UIImageView(image: photo)
        image.frame = CGRect(x: screenWidth/4 + 30, y: screenHeight/2 - 250, width: 150, height: 150)
        image.layer.borderWidth = 1
        image.layer.masksToBounds = false
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.cornerRadius = 75
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        view.addSubview(image)
        
        //Create phoneNum label
        school.frame = CGRect(x: 0, y: 100 + screenHeight/2, width: screenWidth, height: 30)
        school.backgroundColor = .white
        school.text = "School: Heritage High School"
        school.textAlignment = NSTextAlignment(.center)
        school.layer.cornerRadius = 15
        school.layer.masksToBounds = true
        view.addSubview(school)
        school.isHidden = true
        
        //Create email label
        emailAdd.frame = CGRect(x: 0, y: 140 + screenHeight/2, width: screenWidth, height: 30)
        emailAdd.backgroundColor = .white
        emailAdd.text = "Email Address: harshithamahesh@gmail.com"
        emailAdd.textAlignment = NSTextAlignment(.center)
        emailAdd.layer.cornerRadius = 15
        emailAdd.layer.masksToBounds = true
        view.addSubview(emailAdd)
        emailAdd.isHidden = true
    }
  
    @objc func selected(_ sender : UIButton) {
        showing.toggle()
        if showing == true {
            school.isHidden = false
            emailAdd.isHidden = false
            click.setTitle("Tap to hide contact info", for: .normal)
        }
        else {
            school.isHidden = true
            emailAdd.isHidden = true
            click.setTitle("Tap to show contact info", for: .normal)
        }
    }

}

