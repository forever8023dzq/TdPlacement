//
//  XCardView.swift
//  
//
//  Created by Damon Ng on 22/9/22.
//

import UIKit

public class XCardView: UIView {
    public var shadow: Bool = false
    public var cornerRadius: CGFloat = 0
    let shadowOfSetWidth: CGFloat = 0
    let shadowOfSetHeight: CGFloat = 2
    
    let shadowColor: UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.08)
    let shadowOpacity: CGFloat = 1
    
    public init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        if shadow {
            layer.shadowColor = shadowColor.cgColor
            layer.shadowOffset = CGSize(width: shadowOfSetWidth, height: shadowOfSetHeight)
            let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
            layer.shadowPath = shadowPath.cgPath
            layer.shadowOpacity = Float(shadowOpacity)
        }
    }
}
