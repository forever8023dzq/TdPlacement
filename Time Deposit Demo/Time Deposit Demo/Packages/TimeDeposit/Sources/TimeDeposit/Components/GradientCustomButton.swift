//
//  GradientCustomButton.swift
//  
//
//  Created by Apple on 2023/4/16.
//


import UIKit

class GradientCustomButton: UIButton {
     
    @IBInspectable var isGradient: Bool = false
    @IBInspectable var startColor: UIColor = .red
    @IBInspectable var endColor: UIColor = .white
    @IBInspectable var locations: [NSNumber] = [0 , 1]
    @IBInspectable var startPoint: CGPoint = .zero
    @IBInspectable var endPoint: CGPoint = .zero
    @IBInspectable var radius: NSNumber = 0
    private var gradientBGLayer: CAGradientLayer?
     
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientBGLayer?.removeFromSuperlayer()
        if isGradient {
            gradientBGLayer = CAGradientLayer()
            gradientBGLayer!.colors = [startColor.cgColor, endColor.cgColor]
            gradientBGLayer!.locations = locations
            gradientBGLayer!.frame = bounds
            gradientBGLayer!.startPoint = startPoint
            gradientBGLayer!.endPoint = endPoint
            gradientBGLayer!.cornerRadius = CGFloat(radius)
            self.layer.insertSublayer(gradientBGLayer!, at: 0)
        }
    }
     
}
