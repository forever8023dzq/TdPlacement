//
//  File.swift
//  
//
//  Created by Apple on 2023/4/22.
//


import UIKit

class PlacementErrorViewController: XBaseViewController {
   
    
    let identifiers = XAccessibilityIdentifier.EarlyWithdrawal.Success.self
    
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
        text.text = "Unable to process application"
        text.textContainer.lineFragmentPadding = 0
        text.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        text.textColor = TextStyle.OpenSans_Bold_24_Header.color
        text.font = TextStyle.OpenSans_Bold_24_Header.font
        text.backgroundColor = UIColor.clear
        return text
    }()
    
    
    lazy var infoText: UITextView = {
        let text = UITextView()
        text.accessibilityIdentifier = identifiers.headerText
        text.translatesAutoresizingMaskIntoConstraints = false
        text.isEditable = false
        text.isSelectable = false
        text.isScrollEnabled = false
        text.text = "We’re unable to process your application at this time. Please try again later. "
        text.textContainer.lineFragmentPadding = 0
        text.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        text.textColor = TextStyle.OpenSans_Regular_14.color
        text.font = TextStyle.OpenSans_Regular_14.font
        text.backgroundColor = UIColor.clear
        return text
    }()

    
    lazy var backHomeButton: UIButton = {
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
    
    override init() {
        super.init()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func setupViews() {
        super.setupViews()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        topContentView.addArrangedSubview(topSectionImage)
        
        mainContentStackView.addArrangedSubview(headerText)
        mainContentStackView.setCustomSpacing(16, after: headerText)
        mainContentStackView.addArrangedSubview(infoText)
        
        bottomContentStackView.addArrangedSubview(backHomeButton)
        
       
    }
    
    override func setLayoutConstraints() {
        super.setLayoutConstraints()
        NSLayoutConstraint.activate([
            
            backHomeButton.heightAnchor.constraint(equalToConstant: 48),
            
        ])
    }
    
    
}

extension PlacementErrorViewController {
    @objc func goToHomeScreen() {
        navigationController?.popToRootViewController(animated: true)
    }
}

