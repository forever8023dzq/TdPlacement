//
//  CasaTableViewCell.swift
//  
//
//  Created by Apple on 2023/4/23.
//


import UIKit

class CasaTableViewCell: UITableViewCell {
    private let checked = UIImage(named: "icon-checked-radio-button", in: Bundle.module, compatibleWith: nil)
    private let unchecked = UIImage(named: "icon-unchecked-radio-button", in: Bundle.module, compatibleWith: nil)

    var viewModel: CasaAccount!
    
    let identifiers = XAccessibilityIdentifier.EarlyWithdrawal.Form.AccountSelection.AccountCell.self
    
    public override var isSelected: Bool {
        didSet {
            radioButton.image = isSelected ? checked : unchecked
        }
    }

    // MARK: UI Elements
    lazy var circleView: UIView = {
        let circleView = UIView()
        circleView.accessibilityIdentifier = identifiers.circleView
        circleView.translatesAutoresizingMaskIntoConstraints = false
        return circleView
    }()
    
    lazy var accountShortName: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = identifiers.accountShortName
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = TextStyle.OpenSans_SemiBold_12.font
        return label
    }()
    
    lazy var accountName: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = identifiers.accountName
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = TextStyle.OpenSans_SemiBold_16.color
        label.font = TextStyle.OpenSans_SemiBold_16.font
        return label
    }()
    
    lazy var accountNumber: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = identifiers.accountNumber
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = TextStyle.OpenSans_Regular_14.color
        label.font = TextStyle.OpenSans_Regular_14.font
        return label
    }()
    
    lazy var radioButton: UIImageView = {
        let imageView = UIImageView()
        imageView.accessibilityIdentifier = identifiers.radioButton
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        let image = selected ? checked : unchecked
        radioButton.image = image
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        circleView.corners(circleView.bounds.size.height.half)
        circleView.addGradient(
            type: .radial,
            colors: [
                ThemeColors.circleViewGradient1,
                ThemeColors.circleViewGradient2
            ]
        )
    }
    
    func fill(with viewModel: CasaAccount) {
        self.viewModel = viewModel
        accountShortName.text = viewModel.accountShortName
        accountName.text = viewModel.account.accountName
        accountNumber.text = viewModel.currencyType == .SGD ? viewModel.account.formattedAccountNo : "\(viewModel.account.formattedAccountNo) \(viewModel.currencyType.rawValue)"
    }
    
    func setupViews() {
        circleView.addSubview(accountShortName)
        self.contentView.addSubview(circleView)
        self.contentView.addSubview(accountName)
        self.contentView.addSubview(accountNumber)
        self.contentView.addSubview(radioButton)
        setLayoutConstraints()
    }
    
    func setLayoutConstraints() {
        NSLayoutConstraint.activate([
            circleView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            circleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            circleView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -16),
            circleView.heightAnchor.constraint(equalTo: circleView.widthAnchor),
            
            accountShortName.topAnchor.constraint(equalTo: circleView.topAnchor, constant: 12),
            accountShortName.leadingAnchor.constraint(equalTo: circleView.leadingAnchor, constant: 9),
            accountShortName.trailingAnchor.constraint(equalTo: circleView.trailingAnchor, constant: -9),
            accountShortName.bottomAnchor.constraint(equalTo: circleView.bottomAnchor, constant: -12),
            
            accountName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            accountName.leadingAnchor.constraint(equalTo: circleView.trailingAnchor, constant: 16),
            
            accountNumber.topAnchor.constraint(equalTo: accountName.bottomAnchor, constant: 4),
            accountNumber.leadingAnchor.constraint(equalTo: accountName.leadingAnchor),
            accountNumber.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -16),
            
            radioButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            radioButton.leadingAnchor.constraint(equalTo: accountName.trailingAnchor, constant: 18),
            radioButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
            radioButton.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -16),
        ])
    }
}
