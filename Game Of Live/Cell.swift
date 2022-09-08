//
//  Cell.swift
//  Game Of Live
//
//  Created by Dulal Hossain on 8/9/22.
//

import UIKit

class Cell {
    let xCoordinate: Int
    let yCordinate: Int
    var state: State
    var neighbours: [Cell]

    init(_ x:Int, _ y:Int) {
        self.xCoordinate = x
        self.yCordinate = y
        self.state = State.randomState()
        neighbours = [Cell]()
    }
    // return color according to state 
    var color:UIColor {
        return state == .alive ? UIColor.green:UIColor.gray
    }
}
