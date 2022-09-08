//
//  BoardVC.swift
//  Game Of Live
//
//  Created by Dulal Hossain on 8/9/22.
//

import UIKit

class BoardVC: UIViewController {
   
    var life:Life = Life()
    var board:LifeBoard!
    var timer:Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        board = LifeBoard(life)
        
        self.view.addSubview(board)
        board.fitContraintsToParent()
        
        board.isUserInteractionEnabled = true
        let gestureOnBoard:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapOnBoard(_:)))
        board.addGestureRecognizer(gestureOnBoard)
    }
}

extension BoardVC{
    @objc func tapOnBoard(_ recognizer: UITapGestureRecognizer) {
      timer = Timer.scheduledTimer(timeInterval:0.2, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
    }
    
    @objc func tick() {
        life.iterateCells()
        guard let board = board else {
            return
        }
        board.setNeedsDisplay()
    }
}
