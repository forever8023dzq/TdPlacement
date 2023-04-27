//
//  XGeneralInfoModalViewController.swift
//
//
//  Created by Damon Ng on 06/10/22.
//

import UIKit
import WebKit

class XGeneralInfoModalViewController: XBaseViewController {
    public var header: String {
        didSet {
            updateHeader()
        }
    }

    public var content: [GeneralInfoModalContentHtmlModel] {
        didSet {
            updateContent()
        }
    }

    public lazy var headerTextView: UITextView = {
        let textView = UITextView()
        textView.accessibilityIdentifier = "headerTextView"
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isSelectable = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textContainer.lineFragmentPadding = 0
        textView.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        textView.backgroundColor = .white
        textView.font = UIFont(name: "OpenSans-Bold", size: 32)
        textView.textColor = UIColor(red: 0.224, green: 0.278, blue: 0.306, alpha: 1)
        return textView
    }()
    
    public lazy var webView: WKWebView = {
        let webView = WKWebView()
//        if let url = Bundle.main.url(forResource: "declaration_agreement", withExtension: "html") {
//            webView.loadFileURL(url, allowingReadAccessTo: url)
//        }
//        if let url = URL(string:"https://google.com") {
//            let request = URLRequest(url: url)
//            webView.load(request)
//        }
        return webView
    }()

    public lazy var contentStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        return view
    }()

    init(header: String, content: [GeneralInfoModalContentHtmlModel]) {
        self.header = header
        self.content = content
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setupViews() {
        super.setupViews()
        view.backgroundColor = .white
        let closeButton = UIBarButtonItem(
            image: UIImage(named: "icon-cross", in: Bundle.module, compatibleWith: .none),
            style: .plain,
            target: self,
            action: #selector(handleBack)
        )
        navigationItem.leftBarButtonItem = closeButton
        navigationItem.leftBarButtonItem?.tintColor = UIColor(red: 0.341, green: 0.365, blue: 0.396, alpha: 1)
        navigationController?.title = ""
        
        mainContentStackView.addArrangedSubview(headerTextView)
        mainContentStackView.setCustomSpacing(16, after: headerTextView)
        mainContentStackView.addArrangedSubview(webView)
        updateHeader()
        updateContent()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }

    func updateContent() {
        for view in contentStackView.arrangedSubviews {
            view.removeFromSuperview()
        }
        for item in content {
            let contentTextView = XTextView()
            contentTextView.html(
                html: item.html,
                textStyle: item.textStyle,
                handler: item.linkHandler
            )
            contentStackView.addArrangedSubview(contentTextView)
        }
        
        if let url = URL(string:"https://google.com") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }

    func updateHeader() {
        headerTextView.text = header
    }

    @objc func handleBack() {
        dismiss(animated: true, completion: nil)
    }
}
