//
//  CGFloat+.swift
//  
//
//  Created by Damon Ng on 27/9/22.
//

import Foundation

extension CGFloat {
    var half: CGFloat {
        return self.divided(by: 2.0)
    }

    func divided(by value: CGFloat) -> CGFloat {
        if self.isEqual(to: .zero) {
            return .zero
        }

        if value.isEqual(to: .zero) {
            return .zero
        }

        let result = self / value
        return result
    }
}
