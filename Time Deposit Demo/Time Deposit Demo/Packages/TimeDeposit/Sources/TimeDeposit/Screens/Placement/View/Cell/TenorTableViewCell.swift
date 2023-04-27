//
//  TenorTableViewCell.swift
//  
//
//  Created by Apple on 2023/4/19.


import UIKit

class TenorTableViewCell: UITableViewCell {
    private let checked = UIImage(named: "icon-checked-radio-button", in: Bundle.module, compatibleWith: nil)
    private let unchecked = UIImage(named: "icon-unchecked-radio-button", in: Bundle.module, compatibleWith: nil)

    var viewModel: PlacementEntryViewModel.TenorItem!
    
    let identifiers = XAccessibilityIdentifier.EarlyWithdrawal.Form.AccountSelection.AccountCell.self
    
    public override var isSelected: Bool {
        didSet {
            radioButton.image = isSelected ? checked : unchecked
        }
    }

    // MARK: UI Elements

    
    lazy var tenorDetail: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = TextStyle.OpenSans_SemiBold_16.color
        label.font = TextStyle.OpenSans_SemiBold_16.font
        return label
    }()
    
    lazy var interestRate: UILabel = {
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
    
    func fill(with viewModel: PlacementEntryViewModel.TenorItem) {
        self.viewModel = viewModel
        tenorDetail.text = viewModel.termDesc
        interestRate.text = viewModel.interestRateDesc
    }
    
    func setupViews() {
   
        self.contentView.addSubview(tenorDetail)
        self.contentView.addSubview(interestRate)
        self.contentView.addSubview(radioButton)
        setLayoutConstraints()
    }
    
    func setLayoutConstraints() {
        NSLayoutConstraint.activate([
            
            tenorDetail.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            tenorDetail.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            tenorDetail.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -16),
            //tenorDetail.heightAnchor.constraint(equalTo: tenorDetail.widthAnchor),
            
            interestRate.topAnchor.constraint(equalTo: tenorDetail.bottomAnchor, constant: 4),
            interestRate.leadingAnchor.constraint(equalTo: tenorDetail.leadingAnchor),
            interestRate.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -16),
            
            radioButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            //radioButton.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -38),
            radioButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
            radioButton.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -16),
        ])
    }
}
