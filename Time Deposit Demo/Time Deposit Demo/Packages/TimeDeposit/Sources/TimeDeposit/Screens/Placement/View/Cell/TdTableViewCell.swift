//
//  TdTableViewCell.swift
//  
//
//  Created by Apple on 2023/4/23.
//


import UIKit

class TdTableViewCell: UITableViewCell {
    private let checked = UIImage(named: "icon-checked-radio-button", in: Bundle.module, compatibleWith: nil)
    private let unchecked = UIImage(named: "icon-unchecked-radio-button", in: Bundle.module, compatibleWith: nil)

    var viewModel: TDAccount!
    
    let identifiers = XAccessibilityIdentifier.EarlyWithdrawal.Form.AccountSelection.AccountCell.self
    
    public override var isSelected: Bool {
        didSet {
            radioButton.image = isSelected ? checked : unchecked
        }
    }

    // MARK: UI Elements

    
    lazy var accountName: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = TextStyle.OpenSans_SemiBold_16.color
        label.font = TextStyle.OpenSans_SemiBold_16.font
        return label
    }()
    
    lazy var accountNumber: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = TextStyle.OpenSans_Regular_14.color
        label.font = TextStyle.OpenSans_Regular_14.font
        return label
    }()
    
    lazy var accountUserName: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = ""
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
    }
    
    func fill(with viewModel: TDAccount) {
        self.viewModel = viewModel
        accountName.text = viewModel.account.accountName
        accountNumber.text = viewModel.account.formattedAccountNo
        accountUserName.text = viewModel.userName
        
    }
    
    func setupViews() {
   
        self.contentView.addSubview(accountName)
        self.contentView.addSubview(accountNumber)
        self.contentView.addSubview(accountUserName)
        self.contentView.addSubview(radioButton)
        setLayoutConstraints()
    }
    
    func setLayoutConstraints() {
        NSLayoutConstraint.activate([
            
            accountName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            accountName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            accountName.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -16),
            
            accountNumber.topAnchor.constraint(equalTo: accountName.bottomAnchor, constant: 4),
            accountNumber.leadingAnchor.constraint(equalTo: accountName.leadingAnchor),
            accountNumber.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -16),
            
            accountUserName.topAnchor.constraint(equalTo: accountNumber.bottomAnchor, constant: 4),
            accountUserName.leadingAnchor.constraint(equalTo: accountNumber.leadingAnchor),
            accountUserName.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -16),
            
            radioButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            radioButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
            radioButton.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -16),
        ])
    }
}
