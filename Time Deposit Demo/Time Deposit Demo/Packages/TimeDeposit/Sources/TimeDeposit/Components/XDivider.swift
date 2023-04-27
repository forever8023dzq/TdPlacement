//
//  XDivider.swift
//  
//
//  Created by Damon Ng on 22/9/22.
//

import UIKit

public class XDivider: UIView {
    var height: CGFloat!
    var color: UIColor!
    
    public init(_ height: CGFloat, _ color: UIColor? = UIColor(red: 0.886, green: 0.906, blue: 0.925, alpha: 1)) {
        super.init(frame: .zero)
        self.height = height
        self.color = color
        setup()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        backgroundColor = color
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
}
