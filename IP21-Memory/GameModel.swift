//
//  GameModel.swift
//  IP21-Memory
//
//  Created by Mahesh, Harshitha on 5/12/25.
//

import Foundation
import SwiftUI

class GameModel : ObservableObject {
    @Published var cards = ["😃", "😃", "🥶", "🥶", "🤠", "🤠", "👩‍🎓", "👩‍🎓", "👑", "👑", "🕊️", "🕊️", "🌴", "🌴", "💐", "💐"]
    
    func checkEqual(_ card1 : MemoryCard, _ card2 : MemoryCard) -> Bool {
        if (card1.image == card2.image) {
            return true
        }
        return false
    }
}

