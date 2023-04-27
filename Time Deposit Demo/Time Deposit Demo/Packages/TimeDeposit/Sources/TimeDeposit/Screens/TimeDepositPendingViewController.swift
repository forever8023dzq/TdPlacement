//
//  EarlyWithdrawalPendingViewController.swift
//  
//
//  Created by Damon Ng on 6/10/22.
//

import UIKit

class EarlyWithdrawalPendingViewController: XBaseViewController {
    
    let identifiers = XAccessibilityIdentifier.EarlyWithdrawal.Pending.self

    // MARK: - UI Elements
    lazy var topSectionImage: UIImageView = {
        let image = UIImageView()
        image.accessibilityIdentifier = identifiers.topSectionImage
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "acknowledgement-pending", in: Bundle.module, compatibleWith: .none)
        return image
    }()
    
    lazy var headerText: UITextView = {
        let text = UITextView()
        text.accessibilityIdentifier = identifiers.headerText
        text.translatesAutoresizingMaskIntoConstraints = false
        text.isEditable = false
        text.isSelectable = false
        text.isScrollEnabled = false
        text.text = "We are still processing your request."
        text.textContainer.lineFragmentPadding = 0
        text.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        text.textColor = TextStyle.OpenSans_Bold_24_Header.color
        text.font = TextStyle.OpenSans_Bold_24_Header.font
        text.backgroundColor = UIColor.clear
        return text
    }()
    
    lazy var descriptionText: UITextView = {
        let text = UITextView()
        text.accessibilityIdentifier = identifiers.descriptionText
        text.translatesAutoresizingMaskIntoConstraints = false
        text.isEditable = false
        text.isSelectable = false
        text.isScrollEnabled = false
        text.text = "Once your request is processed, you will receive an email by next business day telling you that your maturity instruction has been changed successfully."
        text.textContainer.lineFragmentPadding = 0
        text.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        text.textColor = TextStyle.OpenSans_Regular_14.color
        text.font = TextStyle.OpenSans_Regular_14.font
        text.backgroundColor = UIColor.clear
        return text
    }()
    
    lazy var backToHomeButton: UIButton = {
        let button = UIButton()
        button.accessibilityIdentifier = identifiers.backToHomeButton
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Back to Home", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = TextStyle.OpenSans_SemiBold_16.font
        button.layer.cornerRadius = 4
        button.layer.backgroundColor = UIColor(red: 0.239, green: 0.322, blue: 0.365, alpha: 1).cgColor
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
    
    override func setupViews() {
        super.setupViews()
        topContentView.addArrangedSubview(topSectionImage)
        
        mainContentStackView.addArrangedSubview(headerText)
        mainContentStackView.setCustomSpacing(32, after: headerText)
        mainContentStackView.addArrangedSubview(descriptionText)
        
        bottomContentStackView.addArrangedSubview(backToHomeButton)
    }
    
    override func setLayoutConstraints() {
        super.setLayoutConstraints()
        NSLayoutConstraint.activate([
            backToHomeButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }

}

// MARK: User Actions
extension EarlyWithdrawalPendingViewController {
    @objc func goToHomeScreen() {
        navigationController?.popToRootViewController(animated: true)
    }
}
