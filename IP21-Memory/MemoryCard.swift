//
//  MemoryCard.swift
//  IP21-Memory
//
//  Created by Mahesh, Harshitha on 5/12/25.
//

import Foundation
import SwiftUI

struct MemoryCard : Identifiable {
    let image : String
    let id : UUID
    var cardFlipped : Bool
    
    init(image: String) {
        self.image = image
        self.id = UUID()
        self.cardFlipped = false
    }
    
    
}
