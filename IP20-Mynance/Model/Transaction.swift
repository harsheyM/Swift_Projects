//
//  Transaction.swift
//  IP20-Mynance
//
//  Created by Mahesh, Harshitha on 4/28/25.
//

import Foundation
import SwiftUI

struct Transaction : Identifiable {
    let categ, descrp : String
    let amount : Double
    let date : Date
    let id : UUID
    
    init(categ: String, descrp: String, amount: Double) {
            self.categ   = categ
            self.descrp = descrp
            self.amount  = amount
            self.date = Date()
        self.id = UUID()
    }
    
}
