//
//  EarlyWithdrawalFormViewController.swift
//
//
//  Created by Damon Ng on 21/9/22.
//

import UIKit

public class EarlyWithdrawalFormViewController: XBaseViewController {
    private var viewModel: EarlyWithdrawalFormViewModel!
    
    let identifiers = XAccessibilityIdentifier.EarlyWithdrawal.Form.self
    
    // MARK: - UI Elements
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = identifiers.withdrawalInfoContainerWrapper
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Withdraw before maturity"
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
        label.variant = .large
        label.accessibilityIdentifier = identifiers.withdrawalAmount
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var withdrawalIsImmediateLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = identifiers.withdrawalIsImmediateLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Withdrawal is immediate"
        label.textColor = TextStyle.OpenSans_Regular_12.color
        label.font = TextStyle.OpenSans_Regular_12.font
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
        label.text = "Receipt No. 1"
        label.textColor = TextStyle.OpenSans_Regular_14.color
        label.font = TextStyle.OpenSans_Regular_14.font
        return label
    }()
    
    lazy var timeDepositMaturityDate: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = identifiers.timeDepositMaturityDate
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Initial maturity date: 03 Feb 2022"
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
    
    lazy var changeButton: UIButton = {
        let button = UIButton()
        button.accessibilityIdentifier = identifiers.changeButton
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Change", for: .normal)
        button.setTitleColor(UIColor(red: 0, green: 0.369, blue: 0.992, alpha: 1), for: .normal)
        button.titleLabel?.font = TextStyle.OpenSans_Regular_14.font
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(showAccountSelectionBottomSheet), for: .touchUpInside)
        return button
    }()
    
    lazy var accountSelectionBottomSheet: AccountSelectionViewController = {
        let bottomSheet = AccountSelectionViewController(viewModel: viewModel)
        bottomSheet.preferredSheetBackdropColor = UIColor(red: 0.212, green: 0.231, blue: 0.251, alpha: 1)
        return bottomSheet
    }()
    
    lazy var creditToAccountStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.accessibilityIdentifier = identifiers.creditToAccountStackView
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        return stackView
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
        let textView = UITextView()
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
    
    lazy var inputText: UITextField = {
        let textField = UITextField()
        textField.placeholder = "1111"
        //textField.becomeFirstResponder()
        textField.keyboardType = UIKeyboardType.numberPad
        return textField
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.accessibilityIdentifier = identifiers.nextButton
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = TextStyle.OpenSans_SemiBold_16.font
        button.layer.cornerRadius = 4
        button.layer.backgroundColor = UIColor(red: 0.239, green: 0.322, blue: 0.365, alpha: 1).cgColor
        button.addTarget(self, action: #selector(goToEarlyWithdrawReviewScreen), for: .touchUpInside)
        return button
    }()
    
    let skeletonLoader = XSkeletonLoader()
    
    lazy var accountOpeningBottomSheet: AccountOpeningViewController = {
        let bottomSheet = AccountOpeningViewController(navigation: navigationController,
                                                       viewModel:viewModel)
        bottomSheet.preferredSheetSizing = .fit
        bottomSheet.preferredSheetBackdropColor = UIColor(red: 0.212, green: 0.231, blue: 0.251, alpha: 1)
        bottomSheet.tapToDismissEnabled = true
        bottomSheet.panToDismissEnabled = true
        return bottomSheet
    }()
    
    public required init(viewModel: EarlyWithdrawalFormViewModel) {
        self.viewModel = viewModel
        super.init()
        viewModel.loadData()
        viewModel.loadAccountList()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func setupViews() {
        super.setupViews()
        bind(to: viewModel)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "icon-left-chevron", in: Bundle.module, compatibleWith: nil)
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "icon-left-chevron", in: Bundle.module, compatibleWith: nil)
        navigationController?.navigationBar.tintColor = UIColor(red: 0.341, green: 0.365, blue: 0.396, alpha: 1)
        
        mainContentStackView.addArrangedSubview(headerLabel)
        mainContentStackView.setCustomSpacing(24, after: headerLabel)
        
        withdrawalInfoContainer.addArrangedSubview(withdrawalAmountLabel)
        withdrawalInfoContainer.addArrangedSubview(withdrawalAmount)
        withdrawalInfoContainer.setCustomSpacing(8, after: withdrawalAmount)
        withdrawalInfoContainer.addArrangedSubview(withdrawalIsImmediateLabel)
        withdrawalInfoContainer.setCustomSpacing(16, after: withdrawalIsImmediateLabel)
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
        withdrawalInfoContainer.addArrangedSubview(infoTip)
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
        
        creditToAccountStackView.addArrangedSubview(creditToAccountName)
        creditToAccountStackView.addArrangedSubview(changeButton)
        mainContentStackView.addArrangedSubview(creditToAccountStackView)
        mainContentStackView.addArrangedSubview(creditToAccountNumber)
        mainContentStackView.setCustomSpacing(16, after: creditToAccountNumber)
        mainContentStackView.addArrangedSubview(usdAsNewCurrencyInfoTip)
        mainContentStackView.addArrangedSubview(inputText)
        
        bottomContentStackView.addArrangedSubview(nextButton)
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
            
            changeButton.widthAnchor.constraint(equalToConstant: 50),
            
            nextButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    func bind(to viewModel: EarlyWithdrawalFormViewModel?) {
        viewModel?.state.observe(on: self) { [unowned self] state in
            switch state {
            case .loading:
                showSkeletonLoading()
            case .noCasaAccount:
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.present(self.accountOpeningBottomSheet, animated: true)
                }
            case .error:
                self.navigationController?.pushViewController(EarlyWithdrawalErrorViewController(), animated: true)
            case .none:
                hideSkeletonLoading()
            }
        }
        
        viewModel?.withdrawalAmount.observe(on: self) { [unowned self] amount in
            withdrawalAmount.text = amount.value.formattedValue()
            withdrawalAmount.suffix = amount.currency.rawValue
        }
        
        viewModel?.principalAmount.observe(on: self) { [unowned self] amount in
            principalAmount.text = amount.value.formattedValue()
            principalAmount.suffix = amount.currency.rawValue
        }
        
        viewModel?.interest.observe(on: self) { [unowned self] amount in
            interestAmount.text = amount.value.formattedValue()
            interestAmount.suffix = amount.currency.rawValue
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
        
        viewModel?.isChangeButtonHidden.observe(on: self) { [unowned self] value in
            changeButton.isHidden = false
        }
        
        viewModel?.showUsdAsNewCurrencyInfoTip.observe(on: self) { [unowned self] value in
            usdAsNewCurrencyInfoTip.isHidden = !value
        }
        
        viewModel?.accounts.observe(on: self) { [unowned self] accounts in
            accountSelectionBottomSheet.accounts = accounts
        }
    }
    
}

// MARK: User Actions
extension EarlyWithdrawalFormViewController {
    @objc func showAccountSelectionBottomSheet() {
        self.present(accountSelectionBottomSheet, animated: true)
    }
    
    @objc func goToEarlyWithdrawReviewScreen() {
        let earlyWithdrawalFormViewDetail = EarlyWithdrawalFormViewDetail(viewModel: viewModel)
        navigationController?.pushViewController(EarlyWithdrawalReviewViewController(viewModel: EarlyWithdrawalReviewViewModel(earlyWithdrawalFormViewDetail: earlyWithdrawalFormViewDetail)), animated: true)
    }
}

// MARK: Handle Skeleton Loading
extension EarlyWithdrawalFormViewController {
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
