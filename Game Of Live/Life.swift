//
//  Life.swift
//  Game Of Live
//
//  Created by Dulal Hossain on 8/9/22.
//

import Foundation

// the Game of Life 'Life', contains an array of cells

class Life {
    var cells: [Cell]
    var gridSize: Int = 10
    
    init() {
        cells = []
        for xLoc in 0..<self.gridSize {
            for yLoc in 0..<self.gridSize {
                cells.append(Cell(xLoc, yLoc))
            }
        }
        // find their neighbours
        for cell in cells {
            cell.neighbours = self.neighboursForCell(cell)
        }
    }
    subscript (x: Int, y: Int) -> Cell? {
      return cells.filter { $0.xCoordinate == x && $0.yCordinate == y }.first
    }
}

extension Life {
    func neighboursForCell(_ cell:Cell)->[Cell] {
        let cellsAreNeighbours = {
          (op1: Cell, op2: Cell) -> Bool in
          let delta = (abs(op1.xCoordinate - op2.xCoordinate), abs(op1.yCordinate - op2.yCordinate))
          switch (delta) {
          case (1,1), (1,0), (0,1):
            return true
          default:
            return false
          }
        }
        return self.cells.filter { cellsAreNeighbours(cell, $0)}
    }
    // applies the rules of the Game of Life to the current state
    func iterateCells() {
      
      let aliveNeighboursForCell = {
        (cell: Cell) -> Int in
        cell.neighbours.filter{ $0.state == State.alive }.count
      }
      
      // rules of life
      let liveCells = cells.filter { $0.state == .alive }
      let deadCells = cells.filter { $0.state != .alive }
      
      let dyingCells = liveCells.filter { aliveNeighboursForCell($0) < 2 || aliveNeighboursForCell($0) > 3 }
          
      let newLife =  deadCells.filter { aliveNeighboursForCell($0) == 3 }
      
      // updating the Life state
      newLife.each { (cell: Cell) in cell.state = .alive }
      dyingCells.each { (cell: Cell) in cell.state = .dead }
      
    }
}

extension Array {
  func each<T>(fn: (T) -> ()) {
    for item in self {
        let itemAsT = item as! T
      fn(itemAsT)
    }
  }
}
