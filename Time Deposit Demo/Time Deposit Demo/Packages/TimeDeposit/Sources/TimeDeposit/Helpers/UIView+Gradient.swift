//
//  UIView+Gradient.swift
//  
//
//  Created by Damon Ng on 27/9/22.
//

import UIKit

extension UIView {
    @discardableResult
    func addGradient(
        type: CAGradientLayerType = .axial,
        colors: [UIColor],
        locations: [NSNumber]? = [0, 1],
        startPoint: CGPoint = CGPoint(x: 0, y: 0.5),
        endPoint: CGPoint = CGPoint(x: 1, y: 0.5)
    ) -> CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.type = type
        gradient.locations = locations
        gradient.frame = self.bounds
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        gradient.colors = colors.map { $0.cgColor }
        self.layer.insertSublayer(gradient, at: 0)
        return gradient
    }
}
