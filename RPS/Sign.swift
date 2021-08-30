//
//  Sign.swift
//  RPS
//
//  Created by Owner on 2021/08/27.
//

import GameplayKit
import Foundation

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)
func randomSign() -> Sign{
    let sign = randomChoice.nextInt()
    if sign == 0{
        return .rock
    }else if sign == 1{
        return .scissors
    }else{
        return .paper
    }
}

enum Sign {
    case rock
    case scissors
    case paper
    
    
    var emoji: String{
        switch self {
        case .rock: return "👊🏻"
        case .scissors: return "✌🏻"
        case .paper: return "🖐🏻"
            
        }
    }
    
    func takeTurn(_ opponent: Sign) -> GameState{
        switch self {
        case .rock:
            switch opponent {
            case .rock:
                return GameState.draw
            case .scissors:
                return GameState.win
            case .paper:
                return GameState.lose
            }
        case .scissors:
            switch opponent {
            case .rock:
                return GameState.lose
            case .scissors:
                return GameState.draw
            case .paper:
                return GameState.win
            }
        case .paper:
            switch opponent {
            case .rock:
                return GameState.win
            case .scissors:
                return GameState.lose
            case .paper:
                return GameState.draw
            }
            
        }
    }
}
   


