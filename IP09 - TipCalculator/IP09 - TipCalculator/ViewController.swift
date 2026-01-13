//
//  ViewController.swift
//  IP09 - TipCalculator
//
//  Created by Mahesh, Harshitha on 10/25/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var otherEntry: UITextField!
    @IBOutlet var tipAmount: UILabel!
    @IBOutlet var totalAmount: UILabel!
    @IBOutlet var billAmount: UITextField!
    @IBOutlet var tip: UISegmentedControl!
    @IBOutlet var reset: UIButton!
    var tipVal : Double!
    var tipCost : Double!
    var bill : Double!
    var total : Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        otherEntry.isHidden = true
    }

    @IBAction func tipPerc(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: tipVal = 15
        case 1: tipVal = 18
        case 2: tipVal = 20
        case 3: otherEntry.isHidden = false
        default: break;
        }
        
        if (otherEntry.isHidden == true) {
            calculateTipAmount()
            calculateTotal()
        }
    }
        
    @IBAction func specialTip(_ sender: UITextField) {
        if let tips = sender.text {
            var temp = ""
            temp = tips.replacingOccurrences(of: "$", with: "")
            temp = tips.replacingOccurrences(of: "%", with: "")
            tipVal = Double(temp)
        }
        calculateTipAmount()
        calculateTotal()
    }
    @IBAction func calculateValues(_ sender: UITextField) {
        if var amount = sender.text {
            amount = amount.replacingOccurrences(of: "$", with: "")
            bill = Double(amount)
        }
    }
    
    func calculateTipAmount() {
        tipCost = bill * (tipVal / 100)
        tipAmount.text = "$" + String(format: "%.2f", tipCost)
    }
    func calculateTotal() {
        total = (bill + tipCost)
        totalAmount.text = "$" + String(format: "%.2f", total)
    }
    
    
    @IBAction func resetCalc(_ sender: UIButton) {
        //Reset labels and segments
        otherEntry.text = ""
        otherEntry.isHidden = true
        billAmount.text = ""
        tipAmount.text = "tipAmount"
        totalAmount.text = "totalAmount"
        tip.selectedSegmentIndex = 0
        
        //Reset values for precursors
        total = 0
        tipCost = 0
        bill = 0
    }
    
}

