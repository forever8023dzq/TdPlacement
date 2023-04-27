//
//  MITipViewController.swift
//  
//
//  Created by Apple on 2023/4/20.
//

import Foundation

import UIKit

class MITipViewController: XBottomSheetController {
   
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
    
   
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = identifiers.titleLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title of T&C/informational/tooltip "
        label.textColor = TextStyle.OpenSans_Bold_20_Header.color
        label.font = TextStyle.OpenSans_Bold_20_Header.font
        return label
    }()
    
    lazy var descriptionText: UITextView = {
        let text = UITextView()
        text.accessibilityIdentifier = "id"
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo."
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
    
    lazy var okButton: UIButton = {
        let button = UIButton()
        button.accessibilityIdentifier = "id"
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Okay, got it", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = TextStyle.OpenSans_SemiBold_16.font
        button.layer.cornerRadius = 4
        button.layer.backgroundColor = UIColor(red: 0.239, green: 0.322, blue: 0.365, alpha: 1).cgColor
        button.addTarget(self, action: #selector(closeSheet), for: .touchUpInside)
        return button
    }()
    
    override init() {
        super.init()
        preferredSheetSizing = .semiSmall
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
        view.addSubview(titleLabel)
        view.addSubview(descriptionText)
        view.addSubview(okButton)
        setLayoutConstraints()
    }
    
    func setLayoutConstraints() {
        topNotch.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionText.translatesAutoresizingMaskIntoConstraints = false
        okButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topNotch.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topNotch.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topNotch.heightAnchor.constraint(equalToConstant: 4),
            topNotch.widthAnchor.constraint(equalToConstant: 48),
            
       
            
            titleLabel.topAnchor.constraint(equalTo: topNotch.bottomAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16),
            titleLabel.heightAnchor.constraint(equalToConstant: 32),
            
            descriptionText.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            descriptionText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            okButton.topAnchor.constraint(greaterThanOrEqualTo: descriptionText.bottomAnchor, constant: 40),
            okButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            okButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            okButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            okButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}



extension MITipViewController {
    @objc func closeSheet(){
        debugPrint("closeSheet")
        self.dismiss(animated: true)
    }
}
