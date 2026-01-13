//
//  Account.swift
//  IP20-Mynance
//
//  Created by Mahesh, Harshitha on 4/28/25.
//

import SwiftUI
import Foundation

class Account : ObservableObject {
    @Published var transactions : [Transaction] = []
    @Published var balance : Double = 0
    
    func addOne(categ : String, amount : Double, descr : String) {
        let newOne = Transaction(categ: categ, descrp: descr, amount: amount)
        transactions.append(newOne)
        
    }
    
    func addBalance(bal : Double) {
        balance += bal
    }
    
    
}
