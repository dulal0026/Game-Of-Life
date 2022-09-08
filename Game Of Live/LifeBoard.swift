//
//  LifeBoard.swift
//  Game Of Live
//
//  Created by Dulal Hossain on 8/9/22.
//

import Foundation
import UIKit

class LifeBoard: UIView {
    
    var life:Life
    
    init(_ life:Life) {
        self.life = life
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        for cell in life.cells {
            let cRect = frameRect(cell)
            context.setFillColor(cell.color.cgColor)
            context.fill(cRect)
        }
    }
}

extension LifeBoard {
    func frameRect(_ cell:Cell)-> CGRect{
        let dimensions = CGFloat(self.life.gridSize)
        let cellSize = CGSize(width: self.bounds.width / dimensions, height: self.bounds.height/dimensions)
        return CGRect(x: CGFloat(cell.xCoordinate) * cellSize.width, y: CGFloat(cell.yCordinate) * cellSize.height, width: cellSize.width, height: cellSize.height)
    }
}
