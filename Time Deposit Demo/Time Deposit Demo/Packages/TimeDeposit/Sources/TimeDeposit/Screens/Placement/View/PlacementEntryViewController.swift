
import UIKit

public class PlacementEntryViewController: XBaseViewController {
    
    private var viewModel: PlacementEntryViewModel!
    let identifiers = XAccessibilityIdentifier.EarlyWithdrawal.Form.self
    
    // MARK: - UI Elements
    
    
    lazy var backUi: UIView = {
        let uiview = UIView()
        uiview.backgroundColor = .white
        return uiview
    }()
    
    lazy var tenorSelectionBottomSheet: TenorSelectionViewController = {
        let bottomSheet = TenorSelectionViewController(viewModel: viewModel)
        bottomSheet.preferredSheetBackdropColor = UIColor(red: 0.212, green: 0.231, blue: 0.251, alpha: 1)
        return bottomSheet
    }()
    
    lazy var casaSelectionBottomSheet: CasaSelectionViewController = {
        let bottomSheet = CasaSelectionViewController(viewModel: viewModel)
        bottomSheet.preferredSheetBackdropColor = UIColor(red: 0.212, green: 0.231, blue: 0.251, alpha: 1)
        return bottomSheet
    }()
    
    lazy var tdSelectionBottomSheet: TdSelectionViewController = {
        let bottomSheet = TdSelectionViewController(viewModel: viewModel)
        bottomSheet.preferredSheetBackdropColor = UIColor(red: 0.212, green: 0.231, blue: 0.251, alpha: 1)
        return bottomSheet
    }()
    
    lazy var addPromoBottomSheet: AddPromoViewController = {
        let bottomSheet = AddPromoViewController(viewModel: viewModel)
        bottomSheet.preferredSheetBackdropColor = UIColor(red: 0.212, green: 0.231, blue: 0.251, alpha: 1)
        return bottomSheet
    }()
    
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Place Time Deposit"
        label.textColor = TextStyle.OpenSans_Bold_24_Header.color
        label.font = TextStyle.OpenSans_Bold_24_Header.font
        return label
    }()
    
    lazy var placementInfoContainerWrapper: XCardView = {
        let view = XCardView()
        view.accessibilityIdentifier = ""
        view.shadow = true
        view.cornerRadius = 16
        view.backgroundColor = .white
        return view
    }()
    
    lazy var placementInfoContainer: UIStackView = {
        let view = UIStackView()
        view.accessibilityIdentifier = "id"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.insetsLayoutMarginsFromSafeArea = false
        view.axis = .vertical
        view.setPadding(top: 22, leading: 16, bottom: 24, trailing: 16)
        return view
    }()
    
    lazy var placementAmountLabel: UILabel = {
       
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "You are depositing"
        label.textColor = TextStyle.OpenSans_Regular_12.color
        label.font = TextStyle.OpenSans_Regular_12.font
        return label
    }()
    
    
    lazy var placementAmountAndCurrencyStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.accessibilityIdentifier = "id"
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        return stackView
    }()
    
    lazy var placementAmountInput: UITextField = {
        
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = TextStyle.OpenSans_Bold_24.font
        textField.textColor = UIColor(red: 0.341, green: 0.365, blue: 0.396, alpha: 1)
        textField.placeholder = "0"
        //textField.clearButtonMode = UITextField.ViewMode.always
        //textField.frame = CGRect(x: 20, y: 100, width: 200, height: 30)
        textField.adjustsFontSizeToFitWidth = false
        textField.addTarget(self, action: #selector(textFieldTextDidChange), for: UIControl.Event.editingChanged)
        textField.addTarget(self, action: #selector(textFieldOpen), for: UIControl.Event.editingDidBegin)
        //textField.keyboardType = UIKeyboardType.decimalPad
        textField.keyboardType = UIKeyboardType.numberPad
        return textField
    }()
    
    lazy var amountFilter: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var currencyImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "SGD", in: Bundle.module, compatibleWith: nil))
        return imageView
    }()
    
    lazy var placementCurrencyLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "SGD"
        label.textColor = TextStyle.OpenSans_Regular_16.color
        label.font = TextStyle.OpenSans_Regular_16.font
        return label
    }()
    
    lazy var selectCurrencyImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "icon-info", in: Bundle.module, compatibleWith: nil))
        imageView.isHidden = true
        return imageView
    }()
    
    
    lazy var divider1: XDivider = {
        let divider = XDivider(1)
        return divider
    }()
    
    lazy var divider2: XDivider = {
        let divider = XDivider(1)
        return divider
    }()
    
    
    lazy var minimumStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.accessibilityIdentifier = "id"
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.isHidden = false
        return stackView
    }()
    
    
    lazy var minimumAmount: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.text = "Minimum 5,000 SGD"
        label.textColor = TextStyle.OpenSans_Regular_14.color
        label.font = TextStyle.OpenSans_Regular_14.font
        return label
    }()
    
    lazy var errorShowStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.accessibilityIdentifier = "id"
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.isHidden = true
        return stackView
    }()
    
    lazy var divider1Error: XDivider = {
        let divider = XDivider(1)
        divider.backgroundColor = TextStyle.error_color
        return divider
    }()
    
    lazy var errorShowLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "You do not have sufficient funds "
        label.textColor = TextStyle.error_color
        label.font = TextStyle.OpenSans_Regular_14.font
        return label
    }()
    
    lazy var chooseTenorTextLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Choose your tenor"
        label.textColor = TextStyle.OpenSans_Regular_14.color
        label.font = TextStyle.OpenSans_Regular_14.font
        label.isHidden = false
        return label
    }()
    
    lazy var tenorStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.accessibilityIdentifier = "id"
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        return stackView
    }()
    
    lazy var chooseTenorDetailLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Choose your tenor"
        label.textColor = TextStyle.OpenSans_Regular_16.color
        label.font = TextStyle.OpenSans_Regular_16.font
        label.isHidden = true
        return label
    }()
    
    lazy var tenorDetailLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = TextStyle.OpenSans_SemiBold_16.color
        label.font = TextStyle.OpenSans_SemiBold_16.font
        return label
    }()
    
    lazy var tenorFilter: UIView = {
         let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var selectTenorImageView: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        let downIcon = UIImage(named: "icon-expend-down", in: Bundle.module, compatibleWith: nil)
        btn.setImage(downIcon, for: .normal)
        btn.addTarget(self, action: #selector(addTenor), for: .touchUpInside)
        btn.isHidden = true
        return btn
    }()
    
    lazy var promoButton: GradientCustomButton = {
        let button = GradientCustomButton()
        button.isGradient = true
        button.startColor = UIColor(red:53/255, green:106/255, blue:177/255, alpha: 1)
        button.endColor = UIColor(red:16/255, green:134/255, blue:203/255, alpha: 1)
        button.startPoint = CGPoint(x: 0,y: 0)
        button.endPoint = CGPoint(x: 1,y: 1)
        button.radius = 12
        button.accessibilityIdentifier = "id"
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("PROMO", for: .normal)
        button.titleLabel?.font = TextStyle.OpenSans_Bold_12.font
        button.isUserInteractionEnabled = true
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    lazy var addPromoCodeLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Add promo code"
        label.textColor = TextStyle.OpenSans_Regular_14_blue.color
        label.font = TextStyle.OpenSans_Regular_14_blue.font
        return label
    }()
    
    lazy var addPromoCodeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.accessibilityIdentifier = "id"
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        return stackView
    }()
    
    
    lazy var promoCodeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.accessibilityIdentifier = "id"
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.isHidden = true
        return stackView
    }()
    
    lazy var promoCodeLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Promo code"
        label.textColor = TextStyle.OpenSans_Regular_14.color
        label.font = TextStyle.OpenSans_Regular_14.font
        return label
    }()
    
    
    
    lazy var promoCodeDetailStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.accessibilityIdentifier = "id"
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        return stackView
    }()
    
    lazy var promoCodeNameLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "TimeDeposit123"
        label.textColor = TextStyle.OpenSans_Bold_16.color
        label.font = TextStyle.OpenSans_Bold_16.font
        return label
    }()
    
    
    lazy var promoFilter: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    lazy var removePromoCodeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.accessibilityIdentifier = "id"
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        let tabGesture =  UITapGestureRecognizer(target: self, action: #selector(removePromoCode))
        stackView.addGestureRecognizer(tabGesture)
        return stackView
    }()
    
    
    lazy var promoCodeRemoveLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Remove"
        label.textColor = TextStyle.OpenSans_Regular_14_blue.color
        label.font = TextStyle.OpenSans_Regular_14_blue.font
        return label
    }()
    
    
    lazy var fromAccountLabel: UILabel = {
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
        label.text = "360 Account"
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = TextStyle.OpenSans_Bold_16.color
        label.font = TextStyle.OpenSans_Bold_16.font
        return label
    }()
    
    lazy var changeCasaButton: UIButton = {
        let button = UIButton()
        button.accessibilityIdentifier = identifiers.changeButton
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Change", for: .normal)
        button.setTitleColor(UIColor(red: 0, green: 0.369, blue: 0.992, alpha: 1), for: .normal)
        button.titleLabel?.font = TextStyle.OpenSans_Regular_14.font
        button.addTarget(self, action: #selector(changeCasa), for: .touchUpInside)
        button.isUserInteractionEnabled = true

        return button
    }()
    
    
    lazy var fromAccountStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.accessibilityIdentifier = "id"
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        return stackView
    }()
    
    lazy var fromAccountNumberLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = TextStyle.OpenSans_Regular_14.color
        label.font = TextStyle.OpenSans_Regular_14.font
        label.text = "123-897-65451"
        return label
    }()
    
    lazy var showBalanceStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.accessibilityIdentifier = "id"
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        return stackView
    }()
    
    lazy var showBalanceClickStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.accessibilityIdentifier = "id"
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        let tabGesture =  UITapGestureRecognizer(target: self, action: #selector(showBalance))
        stackView.addGestureRecognizer(tabGesture)
        return stackView
    }()
    
    lazy var showImageView: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        let downIcon = UIImage(named: "icon-eye-open", in: Bundle.module, compatibleWith: nil)
        btn.setImage(downIcon, for: .normal)
        btn.addTarget(self, action: #selector(showBalance), for: .touchUpInside)
        return btn
    }()
    
    lazy var showBalanceLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = TextStyle.OpenSans_Regular_14_blue.color
        label.font = TextStyle.OpenSans_Regular_14_blue.font
        label.text = "Show available balance"
        let tabGesture =  UITapGestureRecognizer(target: self, action: #selector(showBalance))
        label.addGestureRecognizer(tabGesture)
        return label
    }()
    
    public let showFillerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    		
    
    lazy var hideBalanceStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.accessibilityIdentifier = "id"
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.isHidden = true
        return stackView
    }()
    
    lazy var hideBalanceClickStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.accessibilityIdentifier = "id"
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        let tabGesture =  UITapGestureRecognizer(target: self, action: #selector(hideBalance))
        stackView.addGestureRecognizer(tabGesture)
        return stackView
    }()
    
    
    lazy var hideImageView: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        let downIcon = UIImage(named: "icon-eye-close", in: Bundle.module, compatibleWith: nil)
        btn.setImage(downIcon, for: .normal)
        btn.addTarget(self, action: #selector(hideBalance), for: .touchUpInside)
        return btn
    }()
    
    lazy var hideBalanceLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = TextStyle.OpenSans_Regular_14_blue.color
        label.font = TextStyle.OpenSans_Regular_14_blue.font
        label.text = "Hide"
        return label
    }()
    
    lazy var hideBalanceNumberLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = TextStyle.OpenSans_Regular_14.color
        label.font = TextStyle.OpenSans_Regular_14.font
        label.text = "10,000.00 SGD"
        return label
    }()
    
    public let hideFillerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var toAccountLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "To"
        label.textColor = TextStyle.OpenSans_Regular_14.color
        label.font = TextStyle.OpenSans_Regular_14.font
        return label
    }()
    
    lazy var toAccountStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.accessibilityIdentifier = "id"
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        return stackView
    }()
    
    lazy var toAccountClickStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.accessibilityIdentifier = "id"
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        let tabGesture =  UITapGestureRecognizer(target: self, action: #selector(changeAccount))
        stackView.addGestureRecognizer(tabGesture)
        return stackView
    }()
    
    public let toAccountFillerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var changeToAccountButton: UIButton = {
        let button = UIButton()
        button.accessibilityIdentifier = identifiers.changeButton
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Change", for: .normal)
        button.setTitleColor(UIColor(red: 0, green: 0.369, blue: 0.992, alpha: 1), for: .normal)
        button.titleLabel?.font = TextStyle.OpenSans_Regular_14.font
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(changeTd), for: .touchUpInside)
        return button
    }()
    
    lazy var toAccountNameLabel: UILabel = {
        let label = UILabel()
        label.text = "SGD Time Deposit"
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = TextStyle.OpenSans_Bold_16.color
        label.font = TextStyle.OpenSans_Bold_16.font
        return label
    }()
    
    lazy var toAccountNumberLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = "id"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "601-808280-501 SGD"
        label.textColor = TextStyle.OpenSans_Regular_14.color
        label.font = TextStyle.OpenSans_Regular_14.font
        return label
    }()
    
    
    lazy var minimumInfoTip: UIView = {
        let cardView = UIView()
        let imageView = UIImageView(image: UIImage(named: "icon-info", in: Bundle.module, compatibleWith: nil))
        let textView = UITextView()
        cardView.accessibilityIdentifier = "id"
        cardView.backgroundColor = UIColor(red: 1, green: 0.953, blue: 0.906, alpha: 1)
        cardView.corners(8)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        textView.accessibilityIdentifier = "id"
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "Please deposit the minimum amount required to your funding account or choose another funding account before proceeding."
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
    
    lazy var continueButton: UIButton = {
        let button = UIButton()
        button.accessibilityIdentifier = "id"
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Continue", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = TextStyle.OpenSans_SemiBold_16.font
        button.addTarget(self, action: #selector(goToMiScreen), for: .touchUpInside)
        button.layer.cornerRadius = 4
        button.layer.backgroundColor = UIColor(red: 0.239, green: 0.322, blue: 0.365, alpha: 1).cgColor

        return button
    }()
    
    let skeletonLoader = XSkeletonLoader()
    
    
    
    public required init(viewModel: PlacementEntryViewModel) {
        self.viewModel = viewModel
        super.init()
        viewModel.loadFromAccountList()
        viewModel.loadData()
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
        view.backgroundColor = UIColor(red: 240/255, green: 243/255, blue: 245/255, alpha: 1)
        view.addSubview(backUi)
        
        let tabGesture =  UITapGestureRecognizer(target: self, action: #selector(amountEditDone))
        stackView.addGestureRecognizer(tabGesture)
    
        mainContentStackView.backgroundColor = .white
        bottomContentStackView.backgroundColor = .white
        fillerView.backgroundColor = .white
        mainContentStackView.addArrangedSubview(headerLabel)
        mainContentStackView.setCustomSpacing(24, after: headerLabel)
        
        placementInfoContainer.addArrangedSubview(placementAmountLabel)
        placementInfoContainer.setCustomSpacing(2, after: placementAmountLabel)

        placementAmountAndCurrencyStackView.addArrangedSubview(placementAmountInput)
        placementAmountAndCurrencyStackView.addArrangedSubview(amountFilter)
        placementAmountAndCurrencyStackView.addArrangedSubview(currencyImageView)
        placementAmountAndCurrencyStackView.setCustomSpacing(8, after: currencyImageView)
        placementAmountAndCurrencyStackView.addArrangedSubview(placementCurrencyLabel)
        placementAmountAndCurrencyStackView.addArrangedSubview(selectCurrencyImageView)
        
        placementInfoContainer.addArrangedSubview(placementAmountAndCurrencyStackView)
        placementInfoContainer.setCustomSpacing(8, after: placementAmountAndCurrencyStackView)
        
 
//        placementInfoContainer.addArrangedSubview(divider1)
//        placementInfoContainer.setCustomSpacing(16, after: divider1)
        
        placementInfoContainer.addArrangedSubview(minimumStackView)
        minimumStackView.addArrangedSubview(divider1)
        minimumStackView.setCustomSpacing(16, after: divider1)
        minimumStackView.addArrangedSubview(minimumAmount)
        placementInfoContainer.setCustomSpacing(40, after: minimumStackView)
        
        placementInfoContainer.addArrangedSubview(errorShowStackView)
        errorShowStackView.addArrangedSubview(divider1Error)
        errorShowStackView.setCustomSpacing(16, after: divider1Error)
        errorShowStackView.addArrangedSubview(errorShowLabel)
        placementInfoContainer.setCustomSpacing(40, after: errorShowStackView)
        
        placementInfoContainer.addArrangedSubview(chooseTenorTextLabel)
        placementInfoContainer.setCustomSpacing(2, after: chooseTenorTextLabel)
        placementInfoContainer.addArrangedSubview(tenorStackView)
        tenorStackView.addArrangedSubview(tenorDetailLabel)
        tenorStackView.addArrangedSubview(chooseTenorDetailLabel)
        tenorStackView.addArrangedSubview(tenorFilter)
        tenorStackView.addArrangedSubview(promoButton)
        tenorStackView.addArrangedSubview(selectTenorImageView)
        placementInfoContainer.setCustomSpacing(16, after: tenorStackView)
        //placementInfoContainer.addArrangedSubview(selectTenorImageView)
      
        placementInfoContainer.addArrangedSubview(divider2)
        placementInfoContainer.setCustomSpacing(16, after: divider2)
	        
        addPromoCodeStackView.addArrangedSubview(addPromoCodeLabel)
        placementInfoContainer.addArrangedSubview(addPromoCodeStackView)
        
        promoCodeStackView.addArrangedSubview(promoCodeLabel)
        promoCodeStackView.setCustomSpacing(4, after: promoCodeLabel)
        promoCodeStackView.addArrangedSubview(promoCodeDetailStackView)
        promoCodeDetailStackView.addArrangedSubview(promoCodeNameLabel)
        promoCodeDetailStackView.addArrangedSubview(promoFilter)
        promoCodeDetailStackView.addArrangedSubview(removePromoCodeStackView)
        removePromoCodeStackView.addArrangedSubview(promoCodeRemoveLabel)
        placementInfoContainer.addArrangedSubview(promoCodeStackView)
        
        
        placementInfoContainerWrapper.addSubview(placementInfoContainer)
        mainContentStackView.addArrangedSubview(placementInfoContainerWrapper)
        mainContentStackView.setCustomSpacing(24, after: placementInfoContainerWrapper)
        mainContentStackView.addArrangedSubview(fromAccountLabel)
        
        fromAccountStackView.addArrangedSubview(fromAccountNameLabel)
        fromAccountStackView.addArrangedSubview(changeCasaButton)
        mainContentStackView.addArrangedSubview(fromAccountStackView)
        mainContentStackView.addArrangedSubview(fromAccountNumberLabel)
        mainContentStackView.setCustomSpacing(10, after: fromAccountNumberLabel)
        
        showBalanceClickStackView.addArrangedSubview(showImageView)
        showBalanceClickStackView.setCustomSpacing(7.5, after: showImageView)
        showBalanceClickStackView.addArrangedSubview(showBalanceLabel)
        showBalanceStackView.addArrangedSubview(showBalanceClickStackView)
        showBalanceStackView.addArrangedSubview(showFillerView)
        mainContentStackView.addArrangedSubview(showBalanceStackView)
        mainContentStackView.setCustomSpacing(28, after: showBalanceStackView)
        
        hideBalanceClickStackView.addArrangedSubview(hideImageView)
        hideBalanceClickStackView.setCustomSpacing(6, after: hideImageView)
        hideBalanceClickStackView.addArrangedSubview(hideBalanceLabel)
        hideBalanceStackView.addArrangedSubview(hideBalanceClickStackView)
        hideBalanceStackView.setCustomSpacing(4, after: hideBalanceClickStackView)
        hideBalanceStackView.addArrangedSubview(hideBalanceNumberLabel)
        hideBalanceStackView.addArrangedSubview(hideFillerView)
        mainContentStackView.addArrangedSubview(hideBalanceStackView)
        mainContentStackView.setCustomSpacing(28, after: hideBalanceStackView)
        
        mainContentStackView.addArrangedSubview(minimumInfoTip)
        mainContentStackView.setCustomSpacing(26, after: minimumInfoTip)
        
        mainContentStackView.addArrangedSubview(toAccountLabel)
        mainContentStackView.setCustomSpacing(4, after: toAccountLabel)
        mainContentStackView.addArrangedSubview(toAccountStackView)
        toAccountClickStackView.addArrangedSubview(changeToAccountButton)
        toAccountStackView.addArrangedSubview(toAccountNameLabel)
        toAccountStackView.addArrangedSubview(toAccountFillerView)
        toAccountStackView.addArrangedSubview(toAccountClickStackView)
        mainContentStackView.setCustomSpacing(2, after: toAccountStackView)
        mainContentStackView.addArrangedSubview(toAccountNumberLabel)
        
        
        bottomContentStackView.addArrangedSubview(continueButton)
    }
    
    override func setLayoutConstraints() {
        super.setLayoutConstraints()
        NSLayoutConstraint.activate([
            placementInfoContainer.topAnchor.constraint(equalTo: placementInfoContainerWrapper.topAnchor),
            placementInfoContainer.leadingAnchor.constraint(equalTo: placementInfoContainerWrapper.leadingAnchor),
            placementInfoContainer.trailingAnchor.constraint(equalTo: placementInfoContainerWrapper.trailingAnchor),
            placementInfoContainer.bottomAnchor.constraint(equalTo: placementInfoContainerWrapper.bottomAnchor),
            fromAccountLabel.heightAnchor.constraint(equalToConstant: 20),
            fromAccountNumberLabel.heightAnchor.constraint(equalToConstant: 20),
            changeCasaButton.widthAnchor.constraint(equalToConstant: 50),
            continueButton.heightAnchor.constraint(equalToConstant: 48),
            promoButton.widthAnchor.constraint(equalToConstant: 78),
            promoButton.heightAnchor.constraint(equalToConstant: 24),
            placementAmountInput.leadingAnchor.constraint(equalTo: placementInfoContainer.leadingAnchor, constant: 16),
            placementAmountInput.trailingAnchor.constraint(equalTo: currencyImageView.leadingAnchor),
            currencyImageView.heightAnchor.constraint(equalTo: currencyImageView.widthAnchor),
            selectTenorImageView.widthAnchor.constraint(equalToConstant: 13),

        ])
    }
    func bind(to viewModel: PlacementEntryViewModel?) {
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
            
            viewModel?.minimumAmount.observe(on: self) { [unowned self] value in
                let desc = "Minimum " + value.value.formattedValue() + " "+value.currency.rawValue
                minimumAmount.text = desc
            }
            
            viewModel?.fromAccount.observe(on: self) { [unowned self] account in
                fromAccountNameLabel.text = account?.account.accountName
                fromAccountNumberLabel.text = account?.account.formattedAccountNo
            }
            
            viewModel?.toAccount.observe(on: self) { [unowned self] account in
                toAccountNameLabel.text = account?.account.accountName
                toAccountNumberLabel.text = account?.account.formattedAccountNo
            }
            
            viewModel?.isFromChangeBtnHidden.observe(on: self) { [unowned self] value in
                changeCasaButton.isHidden = value
            }
            
            viewModel?.isToChangeBtnHidden.observe(on: self) { [unowned self] value in
                changeToAccountButton.isHidden = value
            }
            
            viewModel?.validaion.observe(on: self) { [unowned self] value in
                if value.amountError {
                    //show amount error message
                    minimumStackView.isHidden = true
                    errorShowStackView.isHidden = false
                    errorShowLabel.text = value.amountMsg
                } else {
                    minimumStackView.isHidden = false
                    errorShowStackView.isHidden = true
                }
                
                if value.fromAccountError {
                    minimumInfoTip.isHidden = false
                } else {
                    minimumInfoTip.isHidden = true
                }
                
                let addTenorGesture =  UITapGestureRecognizer(target: self, action: #selector(addTenor))
                let resetGesture =  UITapGestureRecognizer(target: self, action: #selector(reset))
                let tabPromoGesture =  UITapGestureRecognizer(target: self, action: #selector(addPromoCode))

                if value.isTenorClikable {
                    tenorStackView.addGestureRecognizer(addTenorGesture)
                    selectTenorImageView.addTarget(self, action: #selector(addTenor), for: .touchUpInside)
                    
                } else {
                    tenorStackView.addGestureRecognizer(resetGesture)
                    selectTenorImageView.removeTarget(self, action: #selector(addTenor), for: .touchUpInside)
                }
                
                if value.isPromoClikable {
                    addPromoCodeStackView.addGestureRecognizer(tabPromoGesture)
                } else {
                    addPromoCodeStackView.addGestureRecognizer(resetGesture)
                }
                
                if value.continueBtn {
                    continueButton.addTarget(self, action: #selector(goToMiScreen), for: .touchUpInside)
                    continueButton.layer.backgroundColor = UIColor(red: 0.239, green: 0.322, blue: 0.365, alpha: 1).cgColor
                } else {
                    continueButton.removeTarget(self, action: #selector(goToMiScreen), for: .touchUpInside)
                    continueButton.layer.backgroundColor = UIColor(red: 0.827, green: 0.855, blue: 0.882, alpha: 1).cgColor
                }
                
            }
            
            viewModel?.tenorStatus.observe(on: self) { [unowned self] value in
                switch value {
                case .commonTenor:
                    chooseTenorTextLabel.isHidden = false
                    tenorDetailLabel.isHidden = false
                    chooseTenorDetailLabel.isHidden = true
                    promoButton.isHidden = true
                    selectTenorImageView.isHidden = false
                    break
                case .noTenor:
                    chooseTenorTextLabel.isHidden = true
                    tenorDetailLabel.isHidden = true
                    chooseTenorDetailLabel.isHidden = false
                    promoButton.isHidden = true
                    selectTenorImageView.isHidden = false
                    break
                case .promoTenor:
                    chooseTenorTextLabel.isHidden = false
                    tenorDetailLabel.isHidden = false
                    chooseTenorDetailLabel.isHidden = true
                    promoButton.isHidden = false
                    selectTenorImageView.isHidden = true
                    break
                }
            }
            
            viewModel?.promo.observe(on: self) { [unowned self] value in
                if value.name == "" {
                    promoCodeStackView.isHidden = true
                    addPromoCodeStackView.isHidden = false
                } else {
                    promoCodeStackView.isHidden = false
                    addPromoCodeStackView.isHidden = true
                }
            }
            
            viewModel?.tenor.observe(on: self) { [unowned self] value in
                if value != nil {
                    tenorDetailLabel.text = value?.getInterestRateDescForEntry()
                    viewModel?.tenorStatus.value = .commonTenor
                }
            }
            
            //show hide balance
            viewModel?.availableBalance.observe(on: self) { [unowned self] value in
                hideBalanceNumberLabel.text = value.formatedBalance + " " + value.currency.rawValue
                if value.isShowBalance {
                    hideBalanceStackView.isHidden = false
                    showBalanceStackView.isHidden = true
                } else {
                    hideBalanceStackView.isHidden = true
                    showBalanceStackView.isHidden = false
                }
            }
            
            
            
        }
    }
    
    
}

// MARK: User Actions
extension PlacementEntryViewController {
    @objc func showBalance() {
        viewModel.availableBalance.value.isShowBalance = true
        closeKeyBoard()
    }
    
    @objc func hideBalance() {
        viewModel.availableBalance.value.isShowBalance = false
        closeKeyBoard()
    }
    
    @objc func addPromoCode() {
        
        closeKeyBoard()
        self.present(addPromoBottomSheet, animated: true)
        //viewModel.promo.value.name = "sss"        
        
    }
    
    @objc func textFieldTextDidChange() {
        debugPrint("textFieldTextDidChange")
        if let str: String = placementAmountInput.text {
            if str.contains(".") {
                placementAmountInput.text =  String(viewModel.amount.value)
            }
            if str.count > 6 {
                placementAmountInput.text = String((Int(str) ?? 0) % 1000000)
            }
            
        }
    }
    
    @objc func textFieldOpen() {
        debugPrint("textFieldOpen")
        if let str: String = placementAmountInput.text {
            if str.contains(".") {
                placementAmountInput.text =  String(viewModel.amount.value).replacingOccurrences(of: ".0", with: "")
            }
        }
    }
    
    
    @objc func amountEditDone() {
        //format number
        if placementAmountInput.isEditing {    
            if let amountStr: String = placementAmountInput.text {
                let amount: Double = Double(amountStr) ?? 0
                placementAmountInput.text = String(amount.formattedValue())
                viewModel.amount.value = amount
                viewModel.validate()
                if viewModel.validaion.value.isPromoClikable {
                    viewModel.tenorRetrieve()
                }
            }
        }
        closeKeyBoard()
    }
    
    @objc func validateAmount() -> Bool {
        
        var validation: Validation = Validation(amountError: false, isTenorClikable: false, isPromoClikable: false, amountMsg: "", fromAccountError: false, continueBtn: false)
        
        if viewModel.amount.value < viewModel.minimumAmount.value.value {
            // less than minimum amount
            let errMsg = "A minimum " + viewModel.minimumAmount.value.value.formattedValue() + " " + viewModel.minimumAmount.value.currency.rawValue + " is required"
            validation.amountError = true
            validation.amountMsg = errMsg
            resetPromo()
            resetTenor()
        } else if (viewModel.amount.value > viewModel.availableBalance.value.balance) {
            // more than available balance
            let errMsg = "You do not have sufficient funds"
            validation.amountError = true
            validation.amountMsg = errMsg
            validation.fromAccountError = true
            resetPromo()
            resetTenor()
        } else {
            // amount ok
            validation.isTenorClikable = true
            validation.isPromoClikable = true
        }
        viewModel.validaion.value = validation
        return validation.isTenorClikable
    }
    
    @objc func validateForContinueBtn() {
        
    }
    
    @objc func addTenor() {
        closeKeyBoard()
        self.present(tenorSelectionBottomSheet, animated: true)
    }
    
    @objc func changeCasa() {
        debugPrint("change casa")
        closeKeyBoard()
        self.present(casaSelectionBottomSheet, animated: true)
    }
    
    @objc func changeTd() {
        debugPrint("change td")
        closeKeyBoard()
        self.present(tdSelectionBottomSheet, animated: true)
    }
    
    @objc func reset() {
        debugPrint("reset")
    }
    
    
    @objc func resetTenor() {
        // need to resst tenor and
        viewModel.tenors.value = []
        viewModel.tenor.value = .none
        viewModel.tenorStatus.value = .noTenor
    }
    
    @objc func resetPromo() {
        let promo: Promo = Promo(name: "", code: "", isError: false, errorMsg: "" )
        viewModel.promo.value = promo
    }
    
    
    @objc func closeKeyBoard() {
        if placementAmountInput.isEditing {
            placementAmountInput.resignFirstResponder();
        }
    }
    
    @objc func removePromoCode() {
        viewModel.promo.value.name = ""
        viewModel.promo.value.code = ""
        viewModel.promo.value.errorMsg = ""
        viewModel.promo.value.isError = false
        
        closeKeyBoard()
    }
    
    @objc func changeAccount() {
        print("changeAccount")
    }
    
    @objc func goToMiScreen(){
        let viewModelFCY = EarlyWithdrawalFormViewModel()
        viewModelFCY.productName = "Foreign Currency Time Deposit"
        viewModelFCY.accountNo = "601-808280-501"
        viewModelFCY.accountType = .TimeDeposit
        viewModelFCY.currencyType = .USD
        viewModelFCY.timeDepositNo = 1
        viewModelFCY.transactedAcct = "567123456002"
        viewModelFCY.transactedAcctType = .TimeDeposit
        
   
        //navigationController?.pushViewController(EarlyWithdrawalFormViewController(viewModel: viewModelFCY), animated: true)
        
        let miSelectViewModel = MISelectViewModel(accounts: viewModel.fromAccounts.value)
        navigationController?.pushViewController(MISelectViewController(viewModel: miSelectViewModel), animated: true)
    }
    
    
    
}

// MARK: Handle Skeleton Loading
extension PlacementEntryViewController {
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

