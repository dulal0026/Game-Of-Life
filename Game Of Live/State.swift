//
//  State.swift
//  Game Of Live
//
//  Created by Dulal Hossain on 8/9/22.
//

import Foundation

enum State: Int {
    case alive = 0
    case dead = 1
    
    static func randomState()->State{
        guard let state:State = State(rawValue: Int(arc4random_uniform(2))) else {
            return .dead
        }
        return state
    }
}
