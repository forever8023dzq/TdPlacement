//
//  EarlyWithdrawalSuccessViewController.swift
//  
//
//  Created by Damon Ng on 6/10/22.
//

import UIKit

class EarlyWithdrawalSuccessViewController: XBaseViewController {
    private var viewModel: EarlyWithdrawalSuccessViewModel!
    
    let identifiers = XAccessibilityIdentifier.EarlyWithdrawal.Success.self
    
    // MARK: - UI Elements
    lazy var topSectionImage: UIImageView = {
        let image = UIImageView()
        image.accessibilityIdentifier = identifiers.topSectionImage
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "acknowledgement-success", in: Bundle.module, compatibleWith: .none)
        return image
    }()
    
    lazy var headerText: UITextView = {
        let text = UITextView()
        text.accessibilityIdentifier = identifiers.headerText
        text.translatesAutoresizingMaskIntoConstraints = false
        text.isEditable = false
        text.isSelectable = false
        text.isScrollEnabled = false
        text.text = "Your time deposit has been withdrawn successfully!"
        text.textContainer.lineFragmentPadding = 0
        text.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        text.textColor = TextStyle.OpenSans_Bold_24_Header.color
        text.font = TextStyle.OpenSans_Bold_24_Header.font
        text.backgroundColor = UIColor.clear
        return text
    }()
    
    lazy var withdrawalAmountLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = identifiers.withdrawalAmountLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Withdrawn amount"
        label.textColor = TextStyle.OpenSans_Regular_14.color
        label.font = TextStyle.OpenSans_Regular_14.font
        return label
    }()
    
    lazy var withdrawalAmount: XAmountView = {
        let label = XAmountView()
        label.accessibilityIdentifier = identifiers.withdrawalAmount
        label.translatesAutoresizingMaskIntoConstraints = false
        label.variant = .medium_large
        return label
    }()
    
    lazy var creditToLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = identifiers.creditToLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Credit to"
        label.textColor = TextStyle.OpenSans_Regular_14.color
        label.font = TextStyle.OpenSans_Regular_14.font
        return label
    }()

    lazy var creditToAccountName: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = identifiers.creditToAccountName
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = TextStyle.OpenSans_Bold_16.color
        label.font = TextStyle.OpenSans_Bold_16.font
        return label
    }()

    lazy var creditToAccountNumber: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = identifiers.creditToAccountNumber
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = TextStyle.OpenSans_Regular_14.color
        label.font = TextStyle.OpenSans_Regular_14.font
        return label
    }()
    
    lazy var viewMyBalanceButton: UIButton = {
        let button = UIButton()
        button.accessibilityIdentifier = identifiers.viewMyBalanceButton
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("View my balance", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = TextStyle.OpenSans_SemiBold_16.font
        button.layer.cornerRadius = 4
        button.layer.backgroundColor = UIColor(red: 0.239, green: 0.322, blue: 0.365, alpha: 1).cgColor
        button.addTarget(self, action: #selector(goToViewMyBalanceScreen), for: .touchUpInside)
        return button
    }()
    
    lazy var backToHomeButton: UIButton = {
        let button = UIButton()
        button.accessibilityIdentifier = identifiers.backToHomeButton
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Back to Home", for: .normal)
        button.setTitleColor(UIColor(red: 0.239, green: 0.322, blue: 0.365, alpha: 1), for: .normal)
        button.titleLabel?.font = TextStyle.OpenSans_SemiBold_16.font
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.239, green: 0.322, blue: 0.365, alpha: 1).cgColor
        button.addTarget(self, action: #selector(goToHomeScreen), for: .touchUpInside)
        return button
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    init(viewModel: EarlyWithdrawalSuccessViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func setupViews() {
        super.setupViews()
        bind(to: viewModel)
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        topContentView.addArrangedSubview(topSectionImage)
        
        mainContentStackView.addArrangedSubview(headerText)
        mainContentStackView.setCustomSpacing(32, after: headerText)
        mainContentStackView.addArrangedSubview(withdrawalAmountLabel)
        mainContentStackView.setCustomSpacing(2, after: withdrawalAmountLabel)
        mainContentStackView.addArrangedSubview(withdrawalAmount)
        mainContentStackView.setCustomSpacing(16, after: withdrawalAmount)
        mainContentStackView.addArrangedSubview(creditToLabel)
        mainContentStackView.setCustomSpacing(2, after: creditToLabel)
        mainContentStackView.addArrangedSubview(creditToAccountName)
        mainContentStackView.setCustomSpacing(2, after: creditToAccountName)
        mainContentStackView.addArrangedSubview(creditToAccountNumber)
        
        bottomContentStackView.addArrangedSubview(viewMyBalanceButton)
        bottomContentStackView.setCustomSpacing(16, after: viewMyBalanceButton)
        bottomContentStackView.addArrangedSubview(backToHomeButton)
    }
    
    override func setLayoutConstraints() {
        super.setLayoutConstraints()
        NSLayoutConstraint.activate([
            viewMyBalanceButton.heightAnchor.constraint(equalToConstant: 48),
            backToHomeButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    func bind(to viewModel: EarlyWithdrawalSuccessViewModel?) {
        viewModel?.withdrawalAmount.observe(on: self) { [unowned self] value in
            withdrawalAmount.text = value.value.formattedValue()
            withdrawalAmount.suffix = value.currency.rawValue
        }
        
        viewModel?.creditTo.observe(on: self) { [unowned self] account in
            creditToAccountName.text = account?.accountName
            creditToAccountNumber.text = account?.formattedAccountNo
        }
    }
}

// MARK: User Actions
extension EarlyWithdrawalSuccessViewController {
    @objc func goToViewMyBalanceScreen() {
        
    }
    
    @objc func goToHomeScreen() {
        navigationController?.popToRootViewController(animated: true)
    }
}
