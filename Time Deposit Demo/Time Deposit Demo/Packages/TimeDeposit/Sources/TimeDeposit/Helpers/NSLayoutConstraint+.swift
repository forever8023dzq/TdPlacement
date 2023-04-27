//
//  NSLayoutConstraint+.swift
//  
//
//  Created by Damon Ng on 30/9/22.
//

import UIKit

extension NSLayoutConstraint {
    func withPriority(_ priority: Float) -> NSLayoutConstraint {
        self.priority = UILayoutPriority(priority)
        return self
    }
}
