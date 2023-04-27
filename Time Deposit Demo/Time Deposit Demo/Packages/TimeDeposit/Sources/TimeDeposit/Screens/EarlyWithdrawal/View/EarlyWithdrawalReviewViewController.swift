//
//  EarlyWithdrawReviewViewController.swift
//  
//
//  Created by Damon Ng on 26/9/22.
//

import UIKit

class EarlyWithdrawalReviewViewController: XBaseViewController, XSliderButtonDelegate {
    private let viewModel: EarlyWithdrawalReviewViewModel!
    
    let identifiers = XAccessibilityIdentifier.EarlyWithdrawal.ReviewAndConfirm.self
    
    // MARK: - UI Elements
    lazy var reviewAndConfirmTitle: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = identifiers.reviewAndConfirmTitle
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Review and confirm"
        label.textColor = TextStyle.OpenSans_Bold_24_Header.color
        label.font = TextStyle.OpenSans_Bold_24_Header.font
        return label
    }()
    
    lazy var withdrawalInfoContainerWrapper: XCardView = {
        let view = XCardView()
        view.accessibilityIdentifier = identifiers.withdrawalInfoContainerWrapper
        view.shadow = true
        view.cornerRadius = 16
        view.backgroundColor = .white
        return view
    }()
    
    lazy var withdrawalInfoContainer: UIStackView = {
        let view = UIStackView()
        view.accessibilityIdentifier = identifiers.withdrawalInfoContainer
        view.translatesAutoresizingMaskIntoConstraints = false
        view.insetsLayoutMarginsFromSafeArea = false
        view.axis = .vertical
        view.setPadding(16)
        return view
    }()
    
    lazy var withdrawalAmountLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = identifiers.withdrawalAmountLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Total amount for withdrawal"
        label.textColor = TextStyle.OpenSans_Regular_14.color
        label.font = TextStyle.OpenSans_Regular_14.font
        return label
    }()
    
    lazy var withdrawalAmount: XAmountView = {
        let label = XAmountView()
        label.accessibilityIdentifier = identifiers.withdrawalAmount
        label.variant = .large
        return label
    }()
    
    lazy var divider: XDivider = {
        let divider = XDivider(1)
        return divider
    }()
    
    lazy var principalAmountLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = identifiers.principalAmountLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Principal amount"
        label.textColor = TextStyle.OpenSans_Regular_14.color
        label.font = TextStyle.OpenSans_Regular_14.font
        return label
    }()
    
    lazy var principalAmount: XAmountView = {
        let label = XAmountView()
        label.accessibilityIdentifier = identifiers.principalAmount
        label.variant = .medium
        return label
    }()
    
    lazy var interestLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = identifiers.interestLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Interest"
        label.textColor = TextStyle.OpenSans_Regular_14.color
        label.font = TextStyle.OpenSans_Regular_14.font
        return label
    }()
    
    lazy var interestAmount: XAmountView = {
        let label = XAmountView()
        label.accessibilityIdentifier = identifiers.interestAmount
        label.variant = .medium
        return label
    }()
    
    lazy var earlyWithdrawalFeeLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = identifiers.earlyWithdrawalFeeLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Early withdrawal fee"
        label.textColor = TextStyle.OpenSans_Regular_14.color
        label.font = TextStyle.OpenSans_Regular_14.font
        return label
    }()
    
    lazy var earlyWithdrawalFeeAmount: XAmountView = {
        let label = XAmountView()
        label.accessibilityIdentifier = identifiers.earlyWithdrawalFeeAmount
        label.suffix = "SGD"
        label.variant = .medium
        return label
    }()
    
    lazy var infoTip: XInfoTip = {
        let infoTip = XInfoTip()
        return infoTip
    }()
    
    lazy var withdrawFromLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = identifiers.withdrawFromLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Withdraw from"
        label.textColor = TextStyle.OpenSans_Regular_14.color
        label.font = TextStyle.OpenSans_Regular_14.font
        return label
    }()

    lazy var timeDepositAccountName: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = identifiers.timeDepositAccountName
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = TextStyle.OpenSans_Bold_16.color
        label.font = TextStyle.OpenSans_Bold_16.font
        return label
    }()

    lazy var timeDepositReceiptInfoContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.accessibilityIdentifier = identifiers.timeDepositReceiptInfoContainer
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.alignment = .leading
        return stackView
    }()

    lazy var timeDepositAccountNumber: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = identifiers.timeDepositAccountNumber
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = TextStyle.OpenSans_Regular_14.color
        label.font = TextStyle.OpenSans_Regular_14.font
        return label
    }()

    lazy var timeDepositReceiptNumber: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = identifiers.timeDepositReceiptNumber
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = TextStyle.OpenSans_Regular_14.color
        label.font = TextStyle.OpenSans_Regular_14.font
        return label
    }()

    lazy var timeDepositMaturityDate: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = identifiers.timeDepositMaturityDate
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = TextStyle.OpenSans_Regular_14.color
        label.font = TextStyle.OpenSans_Regular_14.font
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
    
    lazy var usdAsNewCurrencyInfoTip: UIView = {
        let cardView = UIView()
        let imageView = UIImageView(image: UIImage(named: "icon-info", in: Bundle.module, compatibleWith: nil))
        let textView = UITextView(frame: .zero, textContainer: nil)
        cardView.accessibilityIdentifier = identifiers.usdAsNewCurrencyInfoTipCardView
        cardView.backgroundColor = UIColor(red: 0.886, green: 0.906, blue: 0.925, alpha: 1)
        cardView.corners(8)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill

        textView.accessibilityIdentifier = identifiers.usdAsNewCurrencyInfoTipTextView
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "USD will be added as a new currency to this account."
        textView.textColor = TextStyle.OpenSans_Regular_14.color
        textView.font = TextStyle.OpenSans_Regular_14.font
        textView.backgroundColor = UIColor.clear
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.isSelectable = false
        textView.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        textView.textContainer.lineFragmentPadding = 0
        cardView.addSubview(imageView)
        cardView.addSubview(textView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 18),
            imageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 18),
            imageView.bottomAnchor.constraint(lessThanOrEqualTo: cardView.bottomAnchor, constant: -18),
            imageView.heightAnchor.constraint(equalToConstant: 20),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
            
            textView.topAnchor.constraint(equalTo: imageView.topAnchor),
            textView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            textView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            textView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -16)
        ])

        return cardView
    }()
    
    lazy var divider2: XDivider = {
        let divider = XDivider(4, UIColor(red: 0.969, green: 0.976, blue: 0.98, alpha: 1))
        return divider
    }()
    
    lazy var agreementText: XTextView = {
        let text = XTextView()
        text.html(html: "By proceeding, you confirm that you have read, understood and agree to be bound by the <a href='agreement'>Declaration and Agreement</a>, <a href='https://www.ocbc.com/personal-banking/terms-and-conditions/terms-and-conditions-governing-deposit-accounts'>Terms and Conditions Governing Deposit Account</a> and <a href='https://www.ocbc.com/personal-banking/terms-and-conditions/terms-and-conditions-governing-electronic-banking-services'>Terms and Conditions Governing Electronic Banking Service</a>.",
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
        return slider
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.accessibilityIdentifier = identifiers.slideToWithdrawButton
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Pre", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = TextStyle.OpenSans_SemiBold_16.font
        button.layer.cornerRadius = 4
        button.layer.backgroundColor = UIColor(red: 0.239, green: 0.322, blue: 0.365, alpha: 1).cgColor
        button.addTarget(self, action: #selector(goPrePage), for: .touchUpInside)
        return button
    }()
    
    init(viewModel: EarlyWithdrawalReviewViewModel) {
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
//        navigationItem.title = "Withdraw before maturity"
        
        mainContentStackView.addArrangedSubview(reviewAndConfirmTitle)
        mainContentStackView.setCustomSpacing(24, after: reviewAndConfirmTitle)
        
        withdrawalInfoContainer.addArrangedSubview(withdrawalAmountLabel)
        withdrawalInfoContainer.addArrangedSubview(withdrawalAmount)
        withdrawalInfoContainer.setCustomSpacing(8, after: withdrawalAmount)
        withdrawalInfoContainer.addArrangedSubview(divider)
        withdrawalInfoContainer.setCustomSpacing(16, after: divider)
        withdrawalInfoContainer.addArrangedSubview(principalAmountLabel)
        withdrawalInfoContainer.addArrangedSubview(principalAmount)
        withdrawalInfoContainer.setCustomSpacing(18, after: principalAmount)
        withdrawalInfoContainer.addArrangedSubview(interestLabel)
        withdrawalInfoContainer.addArrangedSubview(interestAmount)
        withdrawalInfoContainer.setCustomSpacing(16, after: interestAmount)
        withdrawalInfoContainer.addArrangedSubview(earlyWithdrawalFeeLabel)
        withdrawalInfoContainer.addArrangedSubview(earlyWithdrawalFeeAmount)
        withdrawalInfoContainer.setCustomSpacing(16, after: earlyWithdrawalFeeAmount)
        withdrawalInfoContainerWrapper.addSubview(withdrawalInfoContainer)
        mainContentStackView.addArrangedSubview(withdrawalInfoContainerWrapper)
        mainContentStackView.setCustomSpacing(24, after: withdrawalInfoContainerWrapper)

        mainContentStackView.addArrangedSubview(withdrawFromLabel)
        mainContentStackView.setCustomSpacing(2, after: withdrawFromLabel)
        
        mainContentStackView.addArrangedSubview(timeDepositAccountName)
        mainContentStackView.setCustomSpacing(2, after: timeDepositAccountName)

        timeDepositReceiptInfoContainer.addArrangedSubview(timeDepositAccountNumber)
        timeDepositReceiptInfoContainer.addArrangedSubview(timeDepositReceiptNumber)
        timeDepositReceiptInfoContainer.addArrangedSubview(timeDepositMaturityDate)
        mainContentStackView.addArrangedSubview(timeDepositReceiptInfoContainer)
        mainContentStackView.setCustomSpacing(16, after: timeDepositReceiptInfoContainer)
        
        mainContentStackView.addArrangedSubview(creditToLabel)
        mainContentStackView.setCustomSpacing(2, after: creditToLabel)

        mainContentStackView.addArrangedSubview(creditToAccountName)
        mainContentStackView.setCustomSpacing(2, after: creditToAccountName)
        
        mainContentStackView.addArrangedSubview(creditToAccountNumber)
        mainContentStackView.setCustomSpacing(16, after: creditToAccountNumber)
        mainContentStackView.addArrangedSubview(usdAsNewCurrencyInfoTip)
        
        fillerView.addSubview(divider2)
        fillerView.addSubview(agreementText)
        //bottomContentStackView.addArrangedSubview(nextButton)
        bottomContentStackView.addArrangedSubview(slideToWithdrawButton)
    }
    
    override func setLayoutConstraints() {
        super.setLayoutConstraints()
        NSLayoutConstraint.activate([
            withdrawalInfoContainer.topAnchor.constraint(equalTo: withdrawalInfoContainerWrapper.topAnchor),
            withdrawalInfoContainer.leadingAnchor.constraint(equalTo: withdrawalInfoContainerWrapper.leadingAnchor),
            withdrawalInfoContainer.trailingAnchor.constraint(equalTo: withdrawalInfoContainerWrapper.trailingAnchor),
            withdrawalInfoContainer.bottomAnchor.constraint(equalTo: withdrawalInfoContainerWrapper.bottomAnchor),

            withdrawFromLabel.heightAnchor.constraint(equalToConstant: 20),
            timeDepositAccountName.heightAnchor.constraint(equalToConstant: 24),
            timeDepositAccountNumber.heightAnchor.constraint(equalToConstant: 20),
            timeDepositReceiptNumber.heightAnchor.constraint(equalToConstant: 20),
            timeDepositMaturityDate.heightAnchor.constraint(equalToConstant: 20),
            creditToLabel.heightAnchor.constraint(equalToConstant: 20),
            creditToAccountNumber.heightAnchor.constraint(equalToConstant: 20),
            
            divider2.topAnchor.constraint(equalTo: fillerView.topAnchor, constant: 16),
            divider2.leadingAnchor.constraint(equalTo: fillerView.leadingAnchor),
            divider2.trailingAnchor.constraint(equalTo: fillerView.trailingAnchor),
            
            agreementText.topAnchor.constraint(equalTo: divider2.bottomAnchor, constant: 16),
            agreementText.leadingAnchor.constraint(equalTo: fillerView.leadingAnchor, constant: 16),
            agreementText.trailingAnchor.constraint(equalTo: fillerView.trailingAnchor, constant: -16),
            agreementText.bottomAnchor.constraint(lessThanOrEqualTo: fillerView.bottomAnchor),
            
            slideToWithdrawButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    func bind(to viewModel: EarlyWithdrawalReviewViewModel?) {
        viewModel?.withdrawalAmount.observe(on: self) { [unowned self] value in
            withdrawalAmount.text = value.value.formattedValue()
            withdrawalAmount.suffix = value.currency.rawValue
        }
        
        viewModel?.principalAmount.observe(on: self) { [unowned self] value in
            principalAmount.text = value.value.formattedValue()
            principalAmount.suffix = value.currency.rawValue
        }
        
        viewModel?.interest.observe(on: self) { [unowned self] value in
            interestAmount.text = value.value.formattedValue()
            interestAmount.suffix = value.currency.rawValue
        }
        
        viewModel?.interestInfoTipText.observe(on: self) { [unowned self] value in
            infoTip.text = value
        }
        
        viewModel?.withdrawFrom.observe(on: self) { [unowned self] value in
            timeDepositAccountName.text = value
        }
        
        viewModel?.receiptInfo.observe(on: self) { [unowned self] receiptInfo in
            if let accountNumber = receiptInfo?.accountNumber,
               let currency = receiptInfo?.currency {
                timeDepositAccountNumber.text = "\(accountNumber) \(currency.rawValue)"
            }
            if let receiptNo = receiptInfo?.receiptNo {
                timeDepositReceiptNumber.text = "Receipt No. \(receiptNo)"
            }
            if let maturityDate = receiptInfo?.maturityDate {
                timeDepositMaturityDate.text = "Initial maturity date: \(maturityDate)"
            }
        }
        
        viewModel?.creditTo.observe(on: self) { [unowned self] account in
            creditToAccountName.text = account?.accountName
            creditToAccountNumber.text = account?.formattedAccountNo
        }
        
        viewModel?.isEarlyWithdrawalFeeHidden.observe(on: self) { [unowned self] value in
            earlyWithdrawalFeeLabel.isHidden = value
            earlyWithdrawalFeeAmount.isHidden = value
        }
        
        viewModel?.earlyWithdrawalFee.observe(on: self) { [unowned self] value in
            earlyWithdrawalFeeAmount.text = value.value.formattedValue()
            earlyWithdrawalFeeAmount.suffix = value.currency.rawValue
        }
        
        viewModel?.showUsdAsNewCurrencyInfoTip.observe(on: self) { [unowned self] value in
            usdAsNewCurrencyInfoTip.isHidden = !value
        }
    }
}

// MARK: XSliderButton delegate
extension EarlyWithdrawalReviewViewController {
    func xSliderButtonDelegateDidFinish(_ sender: XSliderButtonView) {
        sender.resetStateWithAnimation(false)
        switch viewModel.creditTo.value?.accountNo {
        case "270339591001", "503001067301":
            self.navigationController?.pushViewController(EarlyWithdrawalPendingViewController(), animated: true)
        case "901008425001", "567123456002":
            self.navigationController?.pushViewController(EarlyWithdrawalErrorViewController(), animated: true)
        default:
            let earlyWithdrawalSuccessViewModel = EarlyWithdrawalSuccessViewModel(
                withdrawalAmount: viewModel.withdrawalAmount.value,
                creditTo: viewModel.creditTo.value
            )
            self.navigationController?.pushViewController(EarlyWithdrawalSuccessViewController(viewModel: earlyWithdrawalSuccessViewModel), animated: true)
        }
    }
}

// MARK: User Actions
extension EarlyWithdrawalReviewViewController {
    @objc func handleLink(_ url: URL) -> Bool {
        switch url.lastPathComponent {
        case "agreement":
            handleShowAgreement()
        default:
            return false
        }
        return true
    }
    
    @objc func goPrePage() {
        navigationController?.popViewController(animated: true)
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
