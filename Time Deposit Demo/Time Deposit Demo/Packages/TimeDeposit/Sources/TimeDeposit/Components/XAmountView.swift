//
//  XAmountView.swift
//  
//
//  Created by Damon Ng on 23/9/22.
//

import UIKit

public class XAmountView: UIStackView {
    public var text: String = "0.00" {
        didSet {
            amount.text = text
        }
    }
    
    public var suffix: String = "SGD" {
        didSet {
            currency.text = suffix
        }
    }
    
    public var variant: Variant = .medium {
        didSet {
            switch variant {
            case .small:
                amount.font = TextStyle.OpenSans_Regular_14.font
                amount.textColor = TextStyle.OpenSans_Regular_14.color
                currency.font = TextStyle.OpenSans_Regular_14.font
                currency.textColor = TextStyle.OpenSans_Regular_14.color
            case .medium:
                amount.font = TextStyle.OpenSans_Bold_16.font
                amount.textColor = TextStyle.OpenSans_Bold_16.color
                currency.font = TextStyle.OpenSans_Regular_14.font
                currency.textColor = TextStyle.OpenSans_Regular_14.color
            case .medium_large:
                amount.font = TextStyle.OpenSans_Bold_16.font
                amount.textColor = TextStyle.OpenSans_Bold_16.color
                currency.font = TextStyle.OpenSans_Regular_16.font
                currency.textColor = TextStyle.OpenSans_Regular_16.color
            case .large:
                amount.font = TextStyle.OpenSans_Bold_24.font
                amount.textColor = TextStyle.OpenSans_Bold_24.color
                currency.font = TextStyle.OpenSans_Regular_16.font
                currency.textColor = TextStyle.OpenSans_Regular_16.color
            }
        }
    }
    
    // MARK: - UI Elements
    lazy var amount: UILabel = {
        let label = UILabel()
        return label
    }()

    lazy var currency: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var filler = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required convenience init(coder: NSCoder) {
        self.init(coder: coder)
    }
    
    func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        self.axis = .horizontal
        self.spacing = 4
        self.alignment = .firstBaseline
        self.addArrangedSubview(amount)
        self.addArrangedSubview(currency)
        self.addArrangedSubview(filler)
    }
    
    public enum Variant {
        case small
        case medium
        case medium_large
        case large
    }
}
