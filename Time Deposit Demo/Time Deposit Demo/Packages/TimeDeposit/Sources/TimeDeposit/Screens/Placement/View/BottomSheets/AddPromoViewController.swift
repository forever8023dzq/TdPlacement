//
//  AddPromoViewController.swift
//  
//
//  Created by Apple on 2023/4/20.
//


import UIKit

class AddPromoViewController: XBottomSheetController {
    var viewModel: PlacementEntryViewModel!
    
    let identifiers = XAccessibilityIdentifier.EarlyWithdrawal.Form.AccountSelection.self
   
    
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
        label.text = "Add a promo code"
        label.textColor = TextStyle.OpenSans_Bold_20_Header.color
        label.font = TextStyle.OpenSans_Bold_20_Header.font
        return label
    }()
    
    lazy var enterPromoLabel: UILabel = {
       
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Enter your promo code"
        label.textColor = TextStyle.OpenSans_Regular_12.color
        label.font = TextStyle.OpenSans_Regular_12.font
        return label
    }()
    
    lazy var promoInput: UITextField = {
        
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = TextStyle.OpenSans_SemiBold_16.font
        textField.textColor = UIColor(red: 0.341, green: 0.365, blue: 0.396, alpha: 1)
        textField.placeholder = "e.g. Timedeposit123"
        textField.becomeFirstResponder()
        textField.adjustsFontSizeToFitWidth = false
//        textField.addTarget(self, action: #selector(textFieldTextDidChange), for: UIControl.Event.editingChanged)
//        textField.addTarget(self, action: #selector(textFieldOpen), for: UIControl.Event.editingDidBegin)
        textField.returnKeyType = UIReturnKeyType.done
        textField.addTarget(self, action: #selector(endEdit), for: UIControl.Event.editingDidEnd)
        
        textField.addTarget(self, action: #selector(endEdit2), for: UIControl.Event.editingDidEndOnExit)
        textField.addTarget(self, action: #selector(startEdit), for: UIControl.Event.editingDidBegin)

        textField.keyboardType = UIKeyboardType.asciiCapable
        return textField
    }()
    
    lazy var divider: XDivider = {
        let divider = XDivider(1)
        divider.backgroundColor = UIColor(red: 0, green: 0.369, blue: 0.992, alpha: 1)
        return divider
    }()
    
    lazy var checked = UIImage(named: "icon-alert-triangle", in: Bundle.module, compatibleWith: nil)
    
    lazy var errorStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.accessibilityIdentifier = "id"
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.isHidden = true
        return stackView
    }()
    
    lazy var errorAlertImg: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "icon-alert-triangle", in: Bundle.module, compatibleWith: nil))
        return imageView
    }()
    
    lazy var errorPromoLabel: UILabel = {
       
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Please enter a valid promo code"
        label.textColor = UIColor(red: 0.929, green: 0.325, blue: 0.278, alpha: 1)
        label.font = TextStyle.OpenSans_Regular_12.font
        return label
    }()
    
    lazy var errorFilter: UIView = {
         let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    lazy var successStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.accessibilityIdentifier = "id"
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.isHidden = true
        return stackView
    }()
    
    lazy var successImg: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "icon-success-check", in: Bundle.module, compatibleWith: nil))
        return imageView
    }()
    
    lazy var successPromoLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Promo code applied"
        label.textColor = UIColor(red: 0.192, green: 0.6, blue: 0.533, alpha: 1)
        label.font = TextStyle.OpenSans_Regular_12.font
        return label
    }()
    
    lazy var successFilter: UIView = {
         let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    public init(viewModel: PlacementEntryViewModel) {

        self.viewModel = viewModel
        super.init()
        preferredSheetSizing = .semiLarge
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        bind(to: viewModel)
        view.backgroundColor = .white
        view.addSubview(topNotch)
        view.addSubview(titleLabel)
        view.addSubview(enterPromoLabel)
        view.addSubview(promoInput)
        view.addSubview(divider)
        errorStackView.addArrangedSubview(errorAlertImg)
        errorStackView.setCustomSpacing(6, after: errorAlertImg)
        errorStackView.addArrangedSubview(errorPromoLabel)
        errorStackView.addArrangedSubview(errorFilter)
        view.addSubview(errorStackView)

        successStackView.addArrangedSubview(successImg)
        successStackView.setCustomSpacing(6, after: successImg)
        successStackView.addArrangedSubview(successPromoLabel)
        successStackView.addArrangedSubview(successFilter)
        view.addSubview(successStackView)
        
        setLayoutConstraints()
    }
    
    func setLayoutConstraints() {
        topNotch.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
       
        
        NSLayoutConstraint.activate([
            topNotch.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topNotch.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topNotch.heightAnchor.constraint(equalToConstant: 4),
            topNotch.widthAnchor.constraint(equalToConstant: 48),
            
            titleLabel.topAnchor.constraint(equalTo: topNotch.bottomAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
                    
            enterPromoLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 34),
            enterPromoLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            enterPromoLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            promoInput.topAnchor.constraint(equalTo: enterPromoLabel.bottomAnchor, constant: 2),
            promoInput.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            promoInput.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            divider.topAnchor.constraint(equalTo: promoInput.bottomAnchor, constant: 8),
            divider.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            divider.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),

            errorStackView.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 8),
            errorStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            errorStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            successStackView.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 8),
            successStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            successStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            errorAlertImg.heightAnchor.constraint(equalTo: errorAlertImg.widthAnchor),
            successImg.heightAnchor.constraint(equalTo: successImg.widthAnchor)
            
        ])
    }
    
    func bind(to viewModel: PlacementEntryViewModel?) {
        viewModel?.promo.observe(on: self) { [unowned self] value in
            //remove loading
            if value.isError {
                errorStackView.isHidden = false
                successStackView.isHidden = true
                enterPromoLabel.isHidden = true
                divider.backgroundColor = UIColor(red: 0.929, green: 0.325, blue: 0.278, alpha: 1)
                promoInput.textColor = UIColor(red: 0.467, green: 0.494, blue: 0.529, alpha: 1)
                promoInput.font = TextStyle.OpenSans_Regular_16.font
            } else {
                enterPromoLabel.isHidden = false
                promoInput.textColor = UIColor(red: 0.341, green: 0.365, blue: 0.396, alpha: 1)
                promoInput.font = TextStyle.OpenSans_SemiBold_16.font
                errorStackView.isHidden = true
                if(value.name != ""){
                    //success
                    errorStackView.isHidden = true
                    successStackView.isHidden = false
                    divider.backgroundColor = UIColor(red: 0.192, green: 0.6, blue: 0.533, alpha: 1)
                } else {
                    errorStackView.isHidden = true
                    successStackView.isHidden = true
                    divider.backgroundColor = UIColor(red: 0, green: 0.369, blue: 0.992, alpha: 1)
                }
            }
        }
    }
}

// MARK: User Actions
extension AddPromoViewController {
    @objc func endEdit() {
        debugPrint(promoInput.enablesReturnKeyAutomatically)
        if let promoCd = promoInput.text {
            divider.backgroundColor = UIColor(red: 0.886, green: 0.906, blue: 0.925, alpha: 1)
            //loading
            viewModel.promo.value.code = promoCd
            viewModel.checkPromo()
        }
    }
    
    @objc func endEdit1() {
        debugPrint("endEdit1")
    }
    
    @objc func endEdit2() {
        debugPrint("endEdit2")
    }
    
    @objc func startEdit() {
        viewModel.resetPromo()
        promoInput.text = ""
    }
}
