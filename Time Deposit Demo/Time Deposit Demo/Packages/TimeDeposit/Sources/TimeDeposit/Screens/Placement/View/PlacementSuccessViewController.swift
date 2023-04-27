//
//  PlacementSuccessViewController.swift
//  
//
//  Created by Apple on 2023/4/22.
//

import UIKit

class PlacementSuccessViewController: XBaseViewController {
    private var viewModel: PlacementSubmitVIewModel!
    
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
        text.text = "You have placed a time deposit amount of 20,000.00 SGD"
        text.textContainer.lineFragmentPadding = 0
        text.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        text.textColor = TextStyle.OpenSans_Bold_24_Header.color
        text.font = TextStyle.OpenSans_Bold_24_Header.font
        text.backgroundColor = UIColor.clear
        return text
    }()
    
    lazy var tenorInsterestTitleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.accessibilityIdentifier = "id"
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .leading
        return stackView
    }()
    
    lazy var tenorInsterestDetailStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.accessibilityIdentifier = "id"
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .leading
        return stackView
    }()
    
    
    lazy var tenorTitleLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tenor"
        label.textColor = TextStyle.OpenSans_Regular_14.color
        label.font = TextStyle.OpenSans_Regular_14.font
        return label
    }()
    
    lazy var interestTitleLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Interest rate"
        label.textColor = TextStyle.OpenSans_Regular_14.color
        label.font = TextStyle.OpenSans_Regular_14.font
        return label
    }()
    
    lazy var tenorDetailLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "6 months"
        label.textColor = TextStyle.OpenSans_Bold_16.color
        label.font = TextStyle.OpenSans_Bold_16.font
        return label
    }()
    
    lazy var interestDetailLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0.5% a year"
        label.textColor = TextStyle.OpenSans_Bold_16.color
        label.font = TextStyle.OpenSans_Bold_16.font
        return label
    }()
    
    lazy var miTitleLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Maturity instruction"
        label.textColor = TextStyle.OpenSans_Regular_14.color
        label.font = TextStyle.OpenSans_Regular_14.font
        return label
    }()
    
    lazy var miDetailLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Auto renew principal and receive interest"
        label.textColor = TextStyle.OpenSans_Bold_16.color
        label.font = TextStyle.OpenSans_Bold_16.font
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var fromTitleLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "From"
        label.textColor = TextStyle.OpenSans_Regular_14.color
        label.font = TextStyle.OpenSans_Regular_14.font
        return label
    }()
    
    lazy var fromAccountNameLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "360 Account"
        label.textColor = TextStyle.OpenSans_Bold_16.color
        label.font = TextStyle.OpenSans_Bold_16.font
        return label
    }()
    
    lazy var fromAccountNumberLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "410-212232-123"
        label.textColor = TextStyle.OpenSans_Regular_14.color
        label.font = TextStyle.OpenSans_Regular_14.font
        return label
    }()
    
    lazy var toTitleLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "To"
        label.textColor = TextStyle.OpenSans_Regular_14.color
        label.font = TextStyle.OpenSans_Regular_14.font
        return label
    }()
    
    lazy var toAccountNameLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "SGD Time Deposit"
        label.textColor = TextStyle.OpenSans_Bold_16.color
        label.font = TextStyle.OpenSans_Bold_16.font
        return label
    }()
    
    lazy var toAccountNumberLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "601-808280-501"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = TextStyle.OpenSans_Regular_14.color
        label.font = TextStyle.OpenSans_Regular_14.font
        return label
    }()
    
    lazy var toAccountUserNameLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Kevin Chan and Wife"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = TextStyle.OpenSans_Regular_14.color
        label.font = TextStyle.OpenSans_Regular_14.font
        return label
    }()
    
    let skeletonLoader = XSkeletonLoader()
    lazy var divider: XDivider = {
        let divider = XDivider(4, UIColor(red: 0.969, green: 0.976, blue: 0.98, alpha: 1))
        return divider
    }()
    
    lazy var backHomeButton: UIButton = {
        let button = UIButton()
        button.accessibilityIdentifier = "id"
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Back to Home", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = TextStyle.OpenSans_SemiBold_16.font
        button.layer.cornerRadius = 4
        button.layer.backgroundColor = UIColor(red: 0.239, green: 0.322, blue: 0.365, alpha: 1).cgColor
        button.addTarget(self, action: #selector(goToHomeScreen), for: .touchUpInside)
        return button
    }()
    
    lazy var newPlacementButton: UIButton = {
        let button = UIButton()
        button.accessibilityIdentifier = "id"
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Place another time deposit ", for: .normal)
        button.setTitleColor(UIColor(red: 0, green: 0.369, blue: 0.992, alpha: 1), for: .normal)
        button.titleLabel?.font = TextStyle.OpenSans_Regular_16.font
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(self, action: #selector(goToPlaceAnotherTD), for: .touchUpInside)
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
    
    init(viewModel: PlacementSubmitVIewModel) {
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
        mainContentStackView.setCustomSpacing(16, after: headerText)
        
        tenorInsterestTitleStackView.addArrangedSubview(tenorTitleLabel)
        tenorInsterestTitleStackView.addArrangedSubview(interestTitleLabel)
        mainContentStackView.addArrangedSubview(tenorInsterestTitleStackView)
        mainContentStackView.setCustomSpacing(4, after: tenorInsterestTitleStackView)
        
        tenorInsterestDetailStackView.addArrangedSubview(tenorDetailLabel)
        tenorInsterestDetailStackView.addArrangedSubview(interestDetailLabel)
        mainContentStackView.addArrangedSubview(tenorInsterestDetailStackView)
        mainContentStackView.setCustomSpacing(16, after: tenorInsterestDetailStackView)
        
        mainContentStackView.addArrangedSubview(miTitleLabel)
        mainContentStackView.addArrangedSubview(miDetailLabel)
        mainContentStackView.setCustomSpacing(4, after: miTitleLabel)
        mainContentStackView.setCustomSpacing(60, after: miDetailLabel)
        
        mainContentStackView.addArrangedSubview(fromTitleLabel)
        mainContentStackView.addArrangedSubview(fromAccountNameLabel)
        mainContentStackView.addArrangedSubview(fromAccountNumberLabel)
        mainContentStackView.setCustomSpacing(2, after: fromTitleLabel)
        mainContentStackView.setCustomSpacing(2, after: fromAccountNameLabel)
        mainContentStackView.setCustomSpacing(16, after: fromAccountNumberLabel)
        
        mainContentStackView.addArrangedSubview(toTitleLabel)
        mainContentStackView.addArrangedSubview(toAccountNameLabel)
        mainContentStackView.addArrangedSubview(toAccountNumberLabel)
        mainContentStackView.addArrangedSubview(toAccountUserNameLabel)
        mainContentStackView.setCustomSpacing(2, after: toTitleLabel)
        mainContentStackView.setCustomSpacing(2, after: toAccountNameLabel)
        mainContentStackView.setCustomSpacing(40, after: toAccountUserNameLabel)
        
        bottomContentStackView.addArrangedSubview(backHomeButton)
        bottomContentStackView.setCustomSpacing(28, after: backHomeButton)
        bottomContentStackView.addArrangedSubview(newPlacementButton)
        bottomContentStackView.setCustomSpacing(40, after: newPlacementButton)
        
        fillerView.addSubview(divider)
    }
    
    override func setLayoutConstraints() {
        super.setLayoutConstraints()
        NSLayoutConstraint.activate([
            interestTitleLabel.leadingAnchor.constraint(equalTo: mainContentStackView.leadingAnchor, constant: UIScreen.main.bounds.width/2),
            interestDetailLabel.leadingAnchor.constraint(equalTo: fillerView.leadingAnchor, constant: UIScreen.main.bounds.width/2),
            backHomeButton.heightAnchor.constraint(equalToConstant: 48),
            divider.topAnchor.constraint(equalTo: miDetailLabel.bottomAnchor, constant: 32),
            divider.leadingAnchor.constraint(equalTo: fillerView.leadingAnchor),
            divider.trailingAnchor.constraint(equalTo: fillerView.trailingAnchor),
        ])
    }
    
    func bind(to viewModel: PlacementSubmitVIewModel?) {
        viewModel?.state.observe(on: self) { [unowned self] state in
            switch state {
            case .loading:
                showSkeletonLoading()
            case .error:
                self.navigationController?.pushViewController(EarlyWithdrawalErrorViewController(), animated: true)
            case .none:
                hideSkeletonLoading()
            case .offhour:
                hideSkeletonLoading()
            }
        }
    }
}

// MARK: User Actions
extension PlacementSuccessViewController {
    @objc func goToPlaceAnotherTD() {
        debugPrint("goToPlaceAnotherTD")
    }
    
    @objc func goToHomeScreen() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func showSkeletonLoading() {
        view.addSubview(skeletonLoader)
        skeletonLoader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        skeletonLoader.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        skeletonLoader.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        skeletonLoader.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    func hideSkeletonLoading() {
        skeletonLoader.removeFromSuperview()
    }
}
