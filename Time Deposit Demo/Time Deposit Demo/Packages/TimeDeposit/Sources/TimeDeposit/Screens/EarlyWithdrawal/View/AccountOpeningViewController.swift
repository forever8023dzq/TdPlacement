//
//  AccountOpeningViewController.swift
//  
//
//  Created by Damon Ng on 18/10/22.
//

import UIKit

class AccountOpeningViewController: XBottomSheetController {
    let navigation: UINavigationController?
    var viewModel: EarlyWithdrawalFormViewModel!
    let identifiers = XAccessibilityIdentifier.EarlyWithdrawal.Form.AccountOpening.self
    
    // MARK: UI Elements
    lazy var topNotch: UIView = {
        let view = UIView()
        view.accessibilityIdentifier = identifiers.topNotch
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.886, green: 0.906, blue: 0.925, alpha: 1)
        view.corners(2)
        return view
    }()
    
    lazy var bannerImage: UIImageView = {
        let image = UIImageView()
        image.accessibilityIdentifier = identifiers.bannerImage
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "acknowledgement-pending", in: Bundle.module, compatibleWith: .none)
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = identifiers.titleLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "You need an OCBC account"
        label.textColor = TextStyle.OpenSans_Bold_24_Header.color
        label.font = TextStyle.OpenSans_Bold_24_Header.font
        return label
    }()
    
    lazy var descriptionText: UITextView = {
        let text = UITextView()
        text.accessibilityIdentifier = identifiers.descriptionText
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "We will use the account to transfer funds when your time deposit matures."
        text.textColor = TextStyle.OpenSans_Regular_14.color
        text.font = TextStyle.OpenSans_Regular_14.font
        text.backgroundColor = UIColor.clear
        text.isEditable = false
        text.isScrollEnabled = false
        text.isSelectable = false
        text.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        text.textContainer.lineFragmentPadding = 0
        return text
    }()
    
    lazy var openAccountButton: UIButton = {
        let button = UIButton()
        button.accessibilityIdentifier = identifiers.openAccountButton
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Open an account", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = TextStyle.OpenSans_SemiBold_16.font
        button.layer.cornerRadius = 4
        button.layer.backgroundColor = UIColor(red: 0.239, green: 0.322, blue: 0.365, alpha: 1).cgColor
        button.addTarget(self, action: #selector(goToApply360AccountScreen), for: .touchUpInside)
        return button
    }()
    
    init(navigation: UINavigationController?,viewModel: EarlyWithdrawalFormViewModel) {
        self.navigation = navigation
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(topNotch)
        view.addSubview(bannerImage)
        view.addSubview(titleLabel)
        view.addSubview(descriptionText)
        view.addSubview(openAccountButton)
        setLayoutConstraints()
    }
    
    func setLayoutConstraints() {
        topNotch.translatesAutoresizingMaskIntoConstraints = false
        bannerImage.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionText.translatesAutoresizingMaskIntoConstraints = false
        openAccountButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topNotch.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topNotch.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topNotch.heightAnchor.constraint(equalToConstant: 4),
            topNotch.widthAnchor.constraint(equalToConstant: 48),
            
            bannerImage.topAnchor.constraint(equalTo: topNotch.topAnchor),
            bannerImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bannerImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: bannerImage.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16),
            titleLabel.heightAnchor.constraint(equalToConstant: 32),
            
            descriptionText.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            descriptionText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            openAccountButton.topAnchor.constraint(greaterThanOrEqualTo: descriptionText.bottomAnchor, constant: 40),
            openAccountButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            openAccountButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            openAccountButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            openAccountButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}

// MARK: User Actions
extension AccountOpeningViewController {
    @objc func goToApply360AccountScreen() {
        let a = Amount(value: 111.11, currency: .AUD)
        viewModel.principalAmount.value = a
        print("go to 360 account")
    }
}
