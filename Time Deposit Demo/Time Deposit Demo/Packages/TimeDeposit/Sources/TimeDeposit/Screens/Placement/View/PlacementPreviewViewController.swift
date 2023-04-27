//
//  PlacementPreviewViewController.swift
//  
//
//  Created by Apple on 2023/4/21.
//

import UIKit

class PlacementPreviewViewController: XBaseViewController, XSliderButtonDelegate {
    private let viewModel: PlacementPreviewViewModel!
    
    let identifiers = XAccessibilityIdentifier.EarlyWithdrawal.ReviewAndConfirm.self
    
    // MARK: - UI Elements
    lazy var reviewAndConfirmTitle: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = identifiers.reviewAndConfirmTitle
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Review Time Deposit"
        label.textColor = TextStyle.OpenSans_Bold_24_Header.color
        label.font = TextStyle.OpenSans_Bold_24_Header.font
        return label
    }()
    
    lazy var principalamountStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.accessibilityIdentifier = "id"
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.isHidden = false
        return stackView
    }()
    
    lazy var principalamountView: UIView = {
        let cardView = UIView()
        
        let imageView = UIImageView(image: UIImage(named: "emphasis-bar", in: Bundle.module, compatibleWith: nil))
        
        let amountLabel = UILabel()
        amountLabel.accessibilityIdentifier = "id"
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.text = "Principal amount"
        amountLabel.textColor = TextStyle.OpenSans_Regular_14.color
        amountLabel.font = TextStyle.OpenSans_Regular_14.font
        
        let amountDetailLabel = UILabel()
        amountDetailLabel.accessibilityIdentifier = "id"
        amountDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        amountDetailLabel.text = "20,000.00"
        amountDetailLabel.textColor = TextStyle.OpenSans_Bold_24.color
        amountDetailLabel.font = TextStyle.OpenSans_Bold_24.font
        
        let amountCurrencyLabel = UILabel()
        amountCurrencyLabel.accessibilityIdentifier = "id"
        amountCurrencyLabel.translatesAutoresizingMaskIntoConstraints = false
        amountCurrencyLabel.text = "SGD"
        amountCurrencyLabel.textColor = TextStyle.OpenSans_Regular_14.color
        amountCurrencyLabel.font = TextStyle.OpenSans_Regular_14.font
        
 
        
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        
        cardView.addSubview(imageView)
        cardView.addSubview(amountLabel)
        cardView.addSubview(amountDetailLabel)
        cardView.addSubview(amountCurrencyLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: cardView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
            imageView.bottomAnchor.constraint(lessThanOrEqualTo: cardView.bottomAnchor),
            //imageView.heightAnchor.constraint(equalToConstant: 64),
            //imageView.widthAnchor.constraint(equalTo: 4),
            
            amountLabel.topAnchor.constraint(equalTo: imageView.topAnchor),
            amountLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
            
            //amountDetailLabel.topAnchor.constraint(equalTo: amountLabel.topAnchor, constant: 16),
            amountDetailLabel.leadingAnchor.constraint(equalTo: amountLabel.leadingAnchor),
            amountDetailLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
            
            amountCurrencyLabel.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: 22),
            amountCurrencyLabel.leadingAnchor.constraint(equalTo: amountDetailLabel.trailingAnchor, constant: 4),
            amountCurrencyLabel.bottomAnchor.constraint(equalTo: amountDetailLabel.bottomAnchor),
     
        ])
        return cardView
    }()
    
    lazy var tenorInsterestTitleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.accessibilityIdentifier = identifiers.timeDepositReceiptInfoContainer
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .leading
        return stackView
    }()
    
    lazy var tenorInsterestDetailStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.accessibilityIdentifier = identifiers.timeDepositReceiptInfoContainer
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .leading
        return stackView
    }()
    
    
    lazy var tenorTitleLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = identifiers.principalAmountLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tenor"
        label.textColor = TextStyle.OpenSans_Regular_14.color
        label.font = TextStyle.OpenSans_Regular_14.font
        return label
    }()
    
    lazy var interestTitleLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = identifiers.principalAmountLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Interest rate"
        label.textColor = TextStyle.OpenSans_Regular_14.color
        label.font = TextStyle.OpenSans_Regular_14.font
        return label
    }()
    
    lazy var tenorDetailLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = identifiers.principalAmountLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "6 months"
        label.textColor = TextStyle.OpenSans_Bold_16.color
        label.font = TextStyle.OpenSans_Bold_16.font
        return label
    }()
    
    lazy var interestDetailLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = identifiers.principalAmountLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0.5% a year"
        label.textColor = TextStyle.OpenSans_Bold_16.color
        label.font = TextStyle.OpenSans_Bold_16.font
        return label
    }()
    
    lazy var divider1: XDivider = {
        let divider = XDivider(4, UIColor(red: 0.969, green: 0.976, blue: 0.98, alpha: 1))
        return divider
    }()
    
    
    lazy var fromTitleLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = identifiers.interestLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "From"
        label.textColor = TextStyle.OpenSans_Regular_14.color
        label.font = TextStyle.OpenSans_Regular_14.font
        return label
    }()
    
    lazy var fromAccountNameLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = identifiers.interestLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "360 Account"
        label.textColor = TextStyle.OpenSans_Bold_16.color
        label.font = TextStyle.OpenSans_Bold_16.font
        return label
    }()
    
    lazy var fromAccountNumberLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = identifiers.interestLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "410-212232-123"
        label.textColor = TextStyle.OpenSans_Regular_14.color
        label.font = TextStyle.OpenSans_Regular_14.font
        return label
    }()
    
    lazy var toTitleLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = identifiers.interestLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "To"
        label.textColor = TextStyle.OpenSans_Regular_14.color
        label.font = TextStyle.OpenSans_Regular_14.font
        return label
    }()
    
    lazy var toAccountNameLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = identifiers.interestLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "SGD Time Deposit"
        label.textColor = TextStyle.OpenSans_Bold_16.color
        label.font = TextStyle.OpenSans_Bold_16.font
        return label
    }()
    
    lazy var toAccountNumberLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = identifiers.interestLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "601-808280-501"
        label.textColor = TextStyle.OpenSans_Regular_14.color
        label.font = TextStyle.OpenSans_Regular_14.font
        return label
    }()
    
    lazy var toAccountUserNameLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = identifiers.interestLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Kevin Chan and Wife"
        label.textColor = TextStyle.OpenSans_Regular_14.color
        label.font = TextStyle.OpenSans_Regular_14.font
        return label
    }()
    
    lazy var miTitleLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = identifiers.interestLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Maturity instruction"
        label.textColor = TextStyle.OpenSans_Regular_14.color
        label.font = TextStyle.OpenSans_Regular_14.font
        return label
    }()
    
    lazy var miDetailLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = identifiers.interestLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Auto renew principal and receive interest"
        label.textColor = TextStyle.OpenSans_Bold_16.color
        label.font = TextStyle.OpenSans_Bold_16.font
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var creditToTitleLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = identifiers.interestLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Credit interest/principal amount to"
        label.textColor = TextStyle.OpenSans_Regular_14.color
        label.font = TextStyle.OpenSans_Regular_14.font
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var creditToAccountNameLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = identifiers.interestLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "360 Account"
        label.textColor = TextStyle.OpenSans_Bold_16.color
        label.font = TextStyle.OpenSans_Bold_16.font
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var creditToAccountNoLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = identifiers.interestLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "410-212232-123"
        label.textColor = TextStyle.OpenSans_Regular_14.color
        label.font = TextStyle.OpenSans_Regular_14.font
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()

    lazy var divider2: XDivider = {
        let divider = XDivider(4, UIColor(red: 0.969, green: 0.976, blue: 0.98, alpha: 1))
        return divider
    }()
    
    lazy var agreementText: XTextView = {
        let text = XTextView()
        text.html(html: "<p>By proceeding, you confirm that you have read, understood and agree to be bound by the <a href='agreement'>Declaration and Agreement</a>, <a href='https://www.ocbc.com/personal-banking/terms-and-conditions/terms-and-conditions-governing-deposit-accounts'>Terms and Conditions Governing Deposit Account</a> and <a href='https://www.ocbc.com/personal-banking/terms-and-conditions/terms-and-conditions-governing-electronic-banking-services'>Terms and Conditions Governing Electronic Banking Service</a>.<br/><br/>I declare and confirm that:<br/><br/>I am the beneficial owner of this SGD or Foreign Currency Time Deposit account and ultimately own or have effective control of it.<br/><br/>The account will be used for savings and/or transactional purposes.<br/><br/>OCBC Bank can rely on my declarations on the beneficial ownership and purpose of the account.</p>",
                  textStyle: TextStyle(font: UIFont(name: "OpenSans-Regular", size: 12)!, color: UIColor(red: 0.467, green: 0.494, blue: 0.529, alpha: 1), lineHeight: 16),
                  linkStyle: TextStyle(font: UIFont(name: "OpenSans-Regular", size: 12)!, color: UIColor(red: 0.00, green: 0.37, blue: 0.99, alpha: 1), lineHeight: 16)
        ) { [weak self] url in
            return self?.handleLink(url) ?? false
        }
        text.accessibilityIdentifier = identifiers.agreementText
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        text.isScrollEnabled = false
        text.isEditable = false
        text.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        text.textContainer.lineFragmentPadding = 0
        return text
    }()
    
    lazy var slideToWithdrawButton: XSliderButtonView = {
        let slider = XSliderButtonView()
        slider.accessibilityIdentifier = identifiers.slideToWithdrawButton
        slider.delegate = self
        slider.labelText = "Slide to place funds"
        return slider
    }()
    
    
    init(viewModel: PlacementPreviewViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override func setupViews() {
        super.setupViews()
        bind(to: viewModel)

        mainContentStackView.addArrangedSubview(reviewAndConfirmTitle)
        mainContentStackView.setCustomSpacing(24, after: reviewAndConfirmTitle)
        
        mainContentStackView.addArrangedSubview(principalamountView)
        mainContentStackView.setCustomSpacing(16, after: principalamountView)
        
        tenorInsterestTitleStackView.addArrangedSubview(tenorTitleLabel)
        tenorInsterestTitleStackView.addArrangedSubview(interestTitleLabel)
        mainContentStackView.addArrangedSubview(tenorInsterestTitleStackView)
        mainContentStackView.setCustomSpacing(4, after: tenorInsterestTitleStackView)
        
        tenorInsterestDetailStackView.addArrangedSubview(tenorDetailLabel)
        tenorInsterestDetailStackView.addArrangedSubview(interestDetailLabel)
        mainContentStackView.addArrangedSubview(tenorInsterestDetailStackView)
        mainContentStackView.setCustomSpacing(52, after: tenorInsterestDetailStackView)
        
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
        mainContentStackView.setCustomSpacing(16, after: toAccountUserNameLabel)
        
        mainContentStackView.addArrangedSubview(miTitleLabel)
        mainContentStackView.addArrangedSubview(miDetailLabel)
        mainContentStackView.setCustomSpacing(4, after: miTitleLabel)
        mainContentStackView.setCustomSpacing(16, after: miDetailLabel)

        mainContentStackView.addArrangedSubview(creditToTitleLabel)
        mainContentStackView.addArrangedSubview(creditToAccountNameLabel)
        mainContentStackView.addArrangedSubview(creditToAccountNoLabel)
        mainContentStackView.setCustomSpacing(2, after: creditToTitleLabel)
        mainContentStackView.setCustomSpacing(2, after: creditToAccountNameLabel)
        mainContentStackView.setCustomSpacing(60, after: creditToAccountNoLabel)
 
        fillerView.addSubview(divider1)
        fillerView.addSubview(divider2)
        fillerView.addSubview(agreementText)
        
    
        bottomContentStackView.addArrangedSubview(slideToWithdrawButton)
    }
    
    override func setLayoutConstraints() {
        super.setLayoutConstraints()
        NSLayoutConstraint.activate([
            interestTitleLabel.leadingAnchor.constraint(equalTo: mainContentStackView.leadingAnchor, constant: UIScreen.main.bounds.width/2),
            interestDetailLabel.leadingAnchor.constraint(equalTo: fillerView.leadingAnchor, constant: UIScreen.main.bounds.width/2),
            
            
            divider1.topAnchor.constraint(equalTo: tenorInsterestDetailStackView.bottomAnchor, constant: 32),
            divider1.leadingAnchor.constraint(equalTo: fillerView.leadingAnchor),
            divider1.trailingAnchor.constraint(equalTo: fillerView.trailingAnchor),
            
            divider2.topAnchor.constraint(equalTo: creditToAccountNoLabel.bottomAnchor, constant: 32),
            divider2.leadingAnchor.constraint(equalTo: fillerView.leadingAnchor),
            divider2.trailingAnchor.constraint(equalTo: fillerView.trailingAnchor),
            
            agreementText.topAnchor.constraint(equalTo: divider2.bottomAnchor, constant: 16),
            agreementText.leadingAnchor.constraint(equalTo: fillerView.leadingAnchor, constant: 16),
            agreementText.trailingAnchor.constraint(equalTo: fillerView.trailingAnchor, constant: -16),
            agreementText.bottomAnchor.constraint(lessThanOrEqualTo: fillerView.bottomAnchor),
            
            slideToWithdrawButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    func bind(to viewModel: PlacementPreviewViewModel?) {
        viewModel?.amount.observe(on: self) { [unowned self] value in
            
        }
        
       
        
       
    }
}

// MARK: XSliderButton delegate
extension PlacementPreviewViewController {
    func xSliderButtonDelegateDidFinish(_ sender: XSliderButtonView) {
        sender.resetStateWithAnimation(false)
        debugPrint("go to submit screen")
        let placementSubmitVIewModel = PlacementSubmitVIewModel()
        navigationController?.pushViewController(PlacementSuccessViewController(viewModel: placementSubmitVIewModel), animated: true)
        //navigationController?.pushViewController(PlacementErrorViewController(), animated: true)
        //navigationController?.pushViewController(PlacementOffhourViewController(), animated: true)
    }
}

// MARK: User Actions
extension PlacementPreviewViewController {
    @objc func handleLink(_ url: URL) -> Bool {
        switch url.lastPathComponent {
        case "agreement":
            handleShowAgreement()
        default:
            return false
        }
        return true
    }
    
    func handleShowAgreement() {
//        let vc = XGeneralInfoModalViewController(header: "Declaration and Agreement", content: [
//            .init(html: "<p>I have read and agree to be bound by the Terms and Conditions Governing Deposit Accounts which is available at www.ocbc.com or upon request. I agree and acknowledge that my Time Deposit placement and any renewal thereon shall besubject to the Terms.</p><br><p>I have read and agree and consent to your (i) Data Protection Policy and (ii) FATCA policy, both available at www.ocbc.com/policies or upon request. I declare that any savings and investments I hold with you, and any profits that they make, will comply with the tax laws of the countries where I live or which I am a citizen of, and any other laws that apply.</p><br><p>I agree that this application shall be subject to the approval of OCBC Bank. OCBC Bank shall entitled at its sole discretion, to reject this application or any part hereof, without furnishing any reasons.</p><br><p>I agree that any cash withdrawal is subject to availability of funds.</p><br><p>I agree that the withdrawal amount payable to me will be net of any fees & charges applicable. Information on Fees & Charges is available in the Pricing Guide at ocbc.com. Examples of some services which are subject to fees & charges are Cheque Clearance, Cash Deposit, Cashier’s Orders and MEPS Fund Transfer.</p><br><p>All the information I have provided in this application is true and complete. I will tell you immediately if any of the information changes.</p>"),
//            .init(html: "<p>For Foreign Currency Time Deposits only</p>", textStyle: .OpenSans_SemiBold_HTML_Header),
//            .init(html: "<p>(a) I acknowledge that: -</p><br><p>(i) there is an inherent exchange rate risk in Foreign Currency Deposits. In particular, a decline in the Foreign Currency’s exchange rate relative to my currency of choice will reduce (or even eliminate) my return or earnings on the Foreign Currency Deposits;</p><br><p>(ii) any funds credited or debited from the Account(s) may diminish in value due to taxes, depreciation or become unavailable due to restrictions (howsoever arising) on convertibility, requisitions, involuntary transfers, distraints of any character, exercise of governmental or military or military powers, war, strikes or other causes beyond OCBC Bank’s reasonable control;</p><br><p>(iii) any currency in which OCBC Bank’s payment obligations are denominated, may become unavailable due to restriction on convertibility, transferability, requisitions, government acts, orders, decrees and regulations, involuntary transfers, distraint of any character, exercise of military or usurped powers, acts of war or civil strife, monetary union or exchange or similar causes beyond OCBC Bank’s reasonable control and OCBC Bank may satisfy such payment obligations by making payment in such other currency as OCBC Bank deems fit.</p><br><p>b. I have carefully studied the currency markets and confirm that my foreign currency deposits in the Account(s) are suitable in the light of my financial position and investment objectives.</p><br><p>c. I hereby authorise OCBC Bank to accept any deposits to the Account(s) in any Foreign Currency whatsoever as OCBC Bank may permit in its sole and absolute discretion.</p><br><p>d. All terms and references used herein which are defined or constructed in the Terms and Conditions Governing Deposit Accounts but are not defined or construed herein shall have the same meaning and construction herein.</p>"),
//            .init(html: "<p>Wholly owned subsidiaries</p>", textStyle: .OpenSans_SemiBold_HTML_Header),
//            .init(html: "Wholly owned subsidiaries OCBC Bank has established two wholly-owned subsidiaries in Singapore and Malaysia to process certain selected transactions for OCBC Bank's customers and for this purpose, customer information may be disclosed to these subsidiaries. Please be assured that customer information will continue to remain within the OCBC Group, subject to any mandatory disclosure required by the relevant regulatory authorities.")
//        ])
        let vc = XWebView(url: "declaration_agreement")
        let subNavigationController = UINavigationController(rootViewController: vc)
        subNavigationController.modalPresentationStyle = .fullScreen
        present(subNavigationController, animated: true)
    }
}
