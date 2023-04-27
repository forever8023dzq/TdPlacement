//
//  MISelectViewController.swift
//  
//
//  Created by Apple on 2023/4/20.
//

import UIKit

public class MISelectViewController: XBaseViewController {
    private var viewModel: MISelectViewModel!
    
    let identifiers = XAccessibilityIdentifier.EarlyWithdrawal.Form.self
    
    // MARK: - UI Elements
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Select your maturity instruction"
        label.textColor = TextStyle.OpenSans_Bold_24_Header.color
        label.font = TextStyle.OpenSans_Bold_24_Header.font
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var infoLinkStackView: UIStackView = {
        let view = UIStackView()
        view.accessibilityIdentifier = "id"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.insetsLayoutMarginsFromSafeArea = false
        view.axis = .horizontal
        let tabGesture =  UITapGestureRecognizer(target: self, action: #selector(showMiTipBottomSheet))
        view.addGestureRecognizer(tabGesture)
        return view
    }()
    
    lazy var infoLinkLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Learn more on the type of instructions"
        label.textColor = UIColor(red: 0, green: 0.369, blue: 0.992, alpha: 1)
        label.font = TextStyle.OpenSans_Regular_16.font
        return label
    }()
    
    lazy var casaSelectionBottomSheet: CreditToSelectionViewController = {
        let bottomSheet = CreditToSelectionViewController(viewModel: viewModel)
        bottomSheet.preferredSheetBackdropColor = UIColor(red: 0.212, green: 0.231, blue: 0.251, alpha: 1)
        return bottomSheet
    }()
    
    private let checked = UIImage(named: "icon-checked-radio-button", in: Bundle.module, compatibleWith: nil)
    private let unchecked = UIImage(named: "icon-unchecked-radio-button", in: Bundle.module, compatibleWith: nil)
    
    lazy var miTypeAStackView: UIStackView = {
        let view = UIStackView()
        view.accessibilityIdentifier = "id"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.insetsLayoutMarginsFromSafeArea = false
        view.axis = .horizontal
        let tabGesture =  UITapGestureRecognizer(target: self, action: #selector(chooseMIA))
        view.addGestureRecognizer(tabGesture)
        return view
    }()
    
    lazy var miALabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Auto renew principal and interest"
        label.textColor = TextStyle.OpenSans_SemiBold_16.color
        label.font = TextStyle.OpenSans_SemiBold_16.font
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var miAFilter: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var miAImageView: UIImageView = {
        let imageView = UIImageView(image: unchecked )
        return imageView
    }()
    
    lazy var miAInfoTip: UIView = {
        let cardView = UIView()
        let imageView = UIImageView(image: UIImage(named: "icon-info", in: Bundle.module, compatibleWith: nil))
        let textView = UITextView()
        cardView.accessibilityIdentifier = "id"
        cardView.backgroundColor = UIColor(red: 0.886, green: 0.906, blue: 0.925, alpha: 1)
        cardView.corners(8)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        textView.accessibilityIdentifier = "id"
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "Your principal amount will auto renew at prevailing board rate upon maturity A"
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
        cardView.isHidden = true
        return cardView
    }()
    
    lazy var miTypeDStackView: UIStackView = {
        let view = UIStackView()
        view.accessibilityIdentifier = "id"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.insetsLayoutMarginsFromSafeArea = false
        view.axis = .horizontal
        let tabGesture =  UITapGestureRecognizer(target: self, action: #selector(chooseMID))
        view.addGestureRecognizer(tabGesture)
        return view
    }()
    
    lazy var miDLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Auto renew principal and receive interest"
        label.textColor = TextStyle.OpenSans_SemiBold_16.color
        label.font = TextStyle.OpenSans_SemiBold_16.font
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var miDFilter: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var miDImageView: UIImageView = {
        let imageView = UIImageView(image: unchecked )
        return imageView
    }()
    
    lazy var creditToDStackView: UIStackView = {
        let view = UIStackView()
        view.accessibilityIdentifier = "id"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.insetsLayoutMarginsFromSafeArea = false
        view.axis = .vertical
        view.isHidden = true
        return view
    }()
    
    lazy var creditToSelectDStackView: UIStackView = {
        let view = UIStackView()
        view.accessibilityIdentifier = "id"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.insetsLayoutMarginsFromSafeArea = false
        view.axis = .horizontal
        let tabGesture =  UITapGestureRecognizer(target: self, action: #selector(changeCreditAccount))
        view.addGestureRecognizer(tabGesture)
        return view
    }()
    
    lazy var creditToDLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Crediting account"
        label.textColor = TextStyle.OpenSans_Regular_14.color
        label.font = TextStyle.OpenSans_Regular_14.font
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var creditAccountDetaiD: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "360 account 410-212232-123"
        label.textColor = TextStyle.OpenSans_SemiBold_16.color
        label.font = TextStyle.OpenSans_SemiBold_16.font
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var creditAccountDFilter: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var creditAccountDIcon1: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "icon-expend-down", in: Bundle.module, compatibleWith: nil))
        return imageView
    }()
    
    lazy var creditAccountDIcon: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        let downIcon = UIImage(named: "icon-expend-down", in: Bundle.module, compatibleWith: nil)
        btn.setImage(downIcon, for: .normal)
        //btn.addTarget(self, action: #selector(addTenor), for: .touchUpInside)
        return btn
    }()
    
    
    
    lazy var miDInfoTip: UIView = {
        let cardView = UIView()
        let imageView = UIImageView(image: UIImage(named: "icon-info", in: Bundle.module, compatibleWith: nil))
        let textView = UITextView()
        cardView.accessibilityIdentifier = "id"
        cardView.backgroundColor = UIColor(red: 0.886, green: 0.906, blue: 0.925, alpha: 1)
        cardView.corners(8)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        textView.accessibilityIdentifier = "id"
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "Your principal amount will auto renew at prevailing board rate upon maturity D"
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
        cardView.isHidden = true
        return cardView
    }()
    
    lazy var miTypeXStackView: UIStackView = {
        let view = UIStackView()
        view.accessibilityIdentifier = "id"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.insetsLayoutMarginsFromSafeArea = false
        view.axis = .horizontal
        let tabGesture =  UITapGestureRecognizer(target: self, action: #selector(chooseMIX))
        view.addGestureRecognizer(tabGesture)
        return view
    }()
    
    lazy var miXLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Receive principal and interest"
        label.textColor = TextStyle.OpenSans_SemiBold_16.color
        label.font = TextStyle.OpenSans_SemiBold_16.font
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var miXFilter: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var miXImageView: UIImageView = {
        let imageView = UIImageView(image: unchecked )
        return imageView
    }()
    
    lazy var creditToXStackView: UIStackView = {
        let view = UIStackView()
        view.accessibilityIdentifier = "id"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.insetsLayoutMarginsFromSafeArea = false
        view.axis = .vertical
        view.isHidden = true
        return view
    }()
    
    lazy var creditToSelectXStackView: UIStackView = {
        let view = UIStackView()
        view.accessibilityIdentifier = "id"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.insetsLayoutMarginsFromSafeArea = false
        view.axis = .horizontal
        let tabGesture =  UITapGestureRecognizer(target: self, action: #selector(changeCreditAccount))
        view.addGestureRecognizer(tabGesture)
        return view
    }()
    
    lazy var creditToXLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Crediting account"
        label.textColor = TextStyle.OpenSans_Regular_14.color
        label.font = TextStyle.OpenSans_Regular_14.font
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var creditAccountDetaiX: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "360 account 410-212232-123"
        label.textColor = TextStyle.OpenSans_SemiBold_16.color
        label.font = TextStyle.OpenSans_SemiBold_16.font
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var creditAccountXFilter: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    

    lazy var creditAccountXIcon: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        let downIcon = UIImage(named: "icon-expend-down", in: Bundle.module, compatibleWith: nil)
        btn.setImage(downIcon, for: .normal)
        //btn.addTarget(self, action: #selector(addTenor), for: .touchUpInside)
        return btn
    }()
    
    lazy var miXInfoTip: UIView = {
        let cardView = UIView()
        let imageView = UIImageView(image: UIImage(named: "icon-info", in: Bundle.module, compatibleWith: nil))
        let textView = UITextView()
        cardView.accessibilityIdentifier = "id"
        cardView.backgroundColor = UIColor(red: 0.886, green: 0.906, blue: 0.925, alpha: 1)
        cardView.corners(8)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        textView.accessibilityIdentifier = "id"
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "Your principal amount will auto renew at prevailing board rate upon maturity X"
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
        cardView.isHidden = true
        return cardView
    }()
    
    lazy var divider1: XDivider = {
        let divider = XDivider(1)
        return divider
    }()
    
    lazy var divider2: XDivider = {
        let divider = XDivider(1)
        return divider
    }()
    
    lazy var divider3: XDivider = {
        let divider = XDivider(1)
        return divider
    }()
    
    
    lazy var miTipBottomSheet: MITipViewController = {
        let bottomSheet = MITipViewController()
        bottomSheet.preferredSheetSizing = .fit
        bottomSheet.preferredSheetBackdropColor = UIColor(red: 0.212, green: 0.231, blue: 0.251, alpha: 1)
        return bottomSheet
    }()
    
    lazy var continueButton: UIButton = {
        let button = UIButton()
        button.accessibilityIdentifier = "id"
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Select maturity instruction", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = TextStyle.OpenSans_SemiBold_16.font
        button.addTarget(self, action: #selector(goToPreReviewScreen), for: .touchUpInside)
        button.layer.cornerRadius = 4
        button.layer.backgroundColor = UIColor(red: 0.239, green: 0.322, blue: 0.365, alpha: 1).cgColor

        return button
    }()
    
    public required init(viewModel: MISelectViewModel) {
        self.viewModel = viewModel
        super.init()
   
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
        mainContentStackView.setCustomSpacing(16, after: headerLabel)
        
        infoLinkStackView.addArrangedSubview(infoLinkLabel)
        mainContentStackView.addArrangedSubview(infoLinkStackView)
        mainContentStackView.setCustomSpacing(56, after: infoLinkStackView)
        
        miTypeAStackView.addArrangedSubview(miALabel)
        miTypeAStackView.addArrangedSubview(miAFilter)
        miTypeAStackView.addArrangedSubview(miAImageView)
        mainContentStackView.addArrangedSubview(miTypeAStackView)
        mainContentStackView.setCustomSpacing(24, after: miTypeAStackView)
        mainContentStackView.addArrangedSubview(miAInfoTip)
        mainContentStackView.setCustomSpacing(40, after: miAInfoTip)
        
        mainContentStackView.addArrangedSubview(divider1)
        mainContentStackView.setCustomSpacing(24, after: divider1)
        
        miTypeDStackView.addArrangedSubview(miDLabel)
        miTypeDStackView.addArrangedSubview(miDFilter)
        miTypeDStackView.addArrangedSubview(miDImageView)
        mainContentStackView.addArrangedSubview(miTypeDStackView)
        mainContentStackView.setCustomSpacing(24, after: miTypeDStackView)
        
        creditToSelectDStackView.addArrangedSubview(creditAccountDetaiD)
        creditToSelectDStackView.addArrangedSubview(creditAccountDFilter)
        creditToSelectDStackView.addArrangedSubview(creditAccountDIcon)
        creditToDStackView.addArrangedSubview(creditToDLabel)
        creditToDStackView.setCustomSpacing(2, after: creditToDLabel)
        creditToDStackView.addArrangedSubview(creditToSelectDStackView)
        mainContentStackView.addArrangedSubview(creditToDStackView)
        mainContentStackView.setCustomSpacing(8,after: creditToDStackView)
        
        mainContentStackView.addArrangedSubview(divider2)
        mainContentStackView.setCustomSpacing(24, after: divider2)
        
        mainContentStackView.addArrangedSubview(miDInfoTip)
        mainContentStackView.setCustomSpacing(40, after: miDInfoTip)
        
        miTypeXStackView.addArrangedSubview(miXLabel)
        miTypeXStackView.addArrangedSubview(miXFilter)
        miTypeXStackView.addArrangedSubview(miXImageView)
        mainContentStackView.addArrangedSubview(miTypeXStackView)
        mainContentStackView.setCustomSpacing(42, after: miTypeXStackView)
        
        creditToSelectXStackView.addArrangedSubview(creditAccountDetaiX)
        creditToSelectXStackView.addArrangedSubview(creditAccountXFilter)
        creditToSelectXStackView.addArrangedSubview(creditAccountXIcon)
        creditToXStackView.addArrangedSubview(creditToXLabel)
        creditToXStackView.setCustomSpacing(2, after: creditToXLabel)
        creditToXStackView.addArrangedSubview(creditToSelectXStackView)
        mainContentStackView.addArrangedSubview(creditToXStackView)
        mainContentStackView.setCustomSpacing(8,after: creditToXStackView)
        
        mainContentStackView.addArrangedSubview(divider3)
        mainContentStackView.setCustomSpacing(12, after: divider3)
        
        mainContentStackView.addArrangedSubview(miXInfoTip)
        mainContentStackView.setCustomSpacing(40, after: miXInfoTip)
        
        bottomContentStackView.addArrangedSubview(continueButton)
        
    }
    
    override func setLayoutConstraints() {
        super.setLayoutConstraints()
        NSLayoutConstraint.activate([
            continueButton.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
    
    func bind(to viewModel: MISelectViewModel?) {
        
        
        viewModel?.miType.observe(on: self) { [unowned self] value in
            if value != "" {
                continueButton.addTarget(self, action: #selector(goToPreReviewScreen), for: .touchUpInside)
                continueButton.layer.backgroundColor = UIColor(red: 0.239, green: 0.322, blue: 0.365, alpha: 1).cgColor
            } else {
                continueButton.removeTarget(self, action: #selector(goToPreReviewScreen), for: .touchUpInside)
                continueButton.layer.backgroundColor = UIColor(red: 0.827, green: 0.855, blue: 0.882, alpha: 1).cgColor
            }
       
        }
        
        viewModel?.creditToAccount.observe(on: self) { [unowned self] account in
            let creditToSrc = (account?.account.accountName ?? "") + " " + (account?.account.formattedAccountNo ?? "")
            creditAccountDetaiD.text = creditToSrc
            creditAccountDetaiX.text = creditToSrc
        }
        
        
        
    }

}

// MARK: User Actions
extension MISelectViewController {
    @objc func showMiTipBottomSheet() {
        debugPrint("showMiTipBottomSheet")
        self.present(miTipBottomSheet, animated: true)
    }
    
    @objc func changeCreditAccount() {
        debugPrint("changeCreditAccount")
        
        self.present(casaSelectionBottomSheet, animated: true)
    }

    
    @objc func chooseMIA() {
        setMITyoe(type: "A")
    }
    
    @objc func chooseMID() {
        setMITyoe(type: "D")
    }
    
    @objc func chooseMIX() {
        setMITyoe(type: "X")
    }
    
    @objc func setMITyoe(type: String) {
        debugPrint("setMITyoe: " + type + " value: " + viewModel.miType.value == "" ? type : "")
        viewModel.miType.value = viewModel.miType.value == type ? "" : type
        clear();
        switch viewModel.miType.value {
        case "A":
            miAImageView.image = checked
            miAInfoTip.isHidden = false
            divider1.isHidden = true
        case "D":
            miDImageView.image = checked
            creditToDStackView.isHidden = false
            miDInfoTip.isHidden = false
            mainContentStackView.setCustomSpacing(42, after: miTypeDStackView)
            mainContentStackView.setCustomSpacing(12, after: divider2)
        case "X":
            miXImageView.image = checked
            creditToXStackView.isHidden = false
            miXInfoTip.isHidden = false
            divider3.isHidden = false
        default:
            debugPrint("type: " + type)
        }
    }
    
    @objc func clear() {
        miAImageView.image = unchecked
        miDImageView.image = unchecked
        miXImageView.image = unchecked
        creditToDStackView.isHidden = true
        creditToXStackView.isHidden = true
        miAInfoTip.isHidden = true
        miDInfoTip.isHidden = true
        miXInfoTip.isHidden = true
        divider1.isHidden = false
        divider3.isHidden = true
        mainContentStackView.setCustomSpacing(24, after: miTypeAStackView)
        mainContentStackView.setCustomSpacing(24, after: miTypeDStackView)
        mainContentStackView.setCustomSpacing(24, after: divider1)
        mainContentStackView.setCustomSpacing(24, after: divider2)
        
        
    }
    
    @objc func goToPreReviewScreen() {
        debugPrint("goToPreReviewScreen")
//        let earlyWithdrawalFormViewDetail = EarlyWithdrawalFormViewDetail(viewModel: viewModel)
//        navigationController?.pushViewController(EarlyWithdrawalReviewViewController(viewModel: EarlyWithdrawalReviewViewModel(earlyWithdrawalFormViewDetail: earlyWithdrawalFormViewDetail)), animated: true)
        let placementPreviewViewModel = PlacementPreviewViewModel()
        navigationController?.pushViewController(PlacementPreviewViewController(viewModel: placementPreviewViewModel), animated: true)
        
    }
}

