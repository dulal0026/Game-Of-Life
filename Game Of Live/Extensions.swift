//
//  Extensions.swift
//  Game Of Live
//
//  Created by user on 8/9/22.
//

import Foundation
import UIKit

extension UIView {
    
    func fitContraintsToParent(insets: UIEdgeInsets = .zero) {
        guard let parent = superview else {
            return
        }
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: insets.left),
            trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: insets.right),
            topAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.topAnchor, constant: insets.top),
            bottomAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.bottomAnchor, constant: insets.bottom)
            ])
    }
}
