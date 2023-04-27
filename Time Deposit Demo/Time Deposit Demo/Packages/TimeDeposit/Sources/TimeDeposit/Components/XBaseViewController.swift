//
//  XBaseViewController.swift
//  
//
//  Created by Damon Ng on 26/9/22.
//

import UIKit

open class XBaseViewController: UIViewController {
    open var constraintToSafeAreaLayoutGuide = true
    
    // MARK: - UI Elements
    public let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    public let uiBackView: UIView = {
        let cardView = UIView()
        let imageView = UIImageView(image: UIImage(named: "icon-info", in: Bundle.module, compatibleWith: nil))
        let textView = UITextView()
  
        cardView.backgroundColor = UIColor(red: 0.886, green: 0.906, blue: 0.925, alpha: 1)
        cardView.corners(8)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill

        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "111"
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
    
    public let stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.insetsLayoutMarginsFromSafeArea = false
        view.axis = .vertical
        view.spacing = 0
        return view
    }()
    
    public let topContentView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        return view
    }()
    
    public let mainContentStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.insetsLayoutMarginsFromSafeArea = false
        view.axis = .vertical
        return view
    }()
    
    public let fillerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public let bottomContentStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        return view
    }()
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setLayoutConstraints()
    }
    
    func setupViews() {
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: TextStyle.OpenSans_Regular_14.font,
            NSAttributedString.Key.foregroundColor: UIColor(red: 0.467, green: 0.494, blue: 0.529, alpha: 1)
        ]
        
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(uiBackView)
        scrollView.addSubview(stackView)

        stackView.addArrangedSubview(topContentView)
        stackView.addArrangedSubview(mainContentStackView)
        stackView.addArrangedSubview(fillerView)
        stackView.addArrangedSubview(bottomContentStackView)
    }
    
    func setLayoutConstraints() {
        if constraintToSafeAreaLayoutGuide {
            NSLayoutConstraint.activate([
                scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
            ])
        } else {
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = false
            NSLayoutConstraint.activate([
                scrollView.topAnchor.constraint(equalTo: view.topAnchor)
            ])
        }
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            uiBackView.topAnchor.constraint(equalTo: scrollView.topAnchor,constant: 224),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).withPriority(250),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            fillerView.topAnchor.constraint(equalTo: mainContentStackView.bottomAnchor),
            fillerView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            fillerView.bottomAnchor.constraint(equalTo: bottomContentStackView.topAnchor),
            fillerView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            fillerView.widthAnchor.constraint(equalTo: stackView.widthAnchor)
        ])
        
        mainContentStackView.setPadding(16)
        bottomContentStackView.setPadding(16)
    }

}
