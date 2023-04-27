//
//  XInfoTip.swift
//  
//
//  Created by Damon Ng on 10/10/22.
//

import UIKit

public class XInfoTip: UIStackView {
    public var text: String? = "" {
        didSet {
            textView.text = text
        }
    }
    
    // MARK: UI Elements
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.accessibilityIdentifier = "infoTipTextView"
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.isSelectable = false
        textView.textColor = TextStyle.OpenSans_Regular_14.color
        textView.font = TextStyle.OpenSans_Regular_14.font
        textView.backgroundColor = UIColor.clear
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required convenience init(coder: NSCoder) {
        self.init(coder: coder)
    }
    
    func setupViews() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor(red: 0.886, green: 0.906, blue: 0.925, alpha: 1)
        self.corners(8)
        self.setPadding(16)
        self.addArrangedSubview(textView)
    }
    
}
