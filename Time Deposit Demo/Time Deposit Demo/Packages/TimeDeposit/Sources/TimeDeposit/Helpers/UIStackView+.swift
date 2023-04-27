//
//  UIStackView+.swift
//  
//
//  Created by Damon Ng on 26/9/22.
//

import UIKit

extension UIStackView {
    func setPadding(_ padding: CGFloat) {
        setPadding(x: padding, y: padding)
    }

    func setPadding(x: CGFloat, y: CGFloat) {
        setPadding(top: y, leading: x, bottom: y, trailing: x)
    }

    func setPadding(top: CGFloat, leading: CGFloat, bottom: CGFloat, trailing: CGFloat) {
        isLayoutMarginsRelativeArrangement = true
        directionalLayoutMargins = NSDirectionalEdgeInsets(top: top, leading: leading, bottom: bottom, trailing: trailing)
    }
}
