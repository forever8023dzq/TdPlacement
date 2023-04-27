//
//  XWebView.swift
//  
//
//  Created by Damon Ng on 18/10/22.
//

import UIKit
import WebKit

class XWebView: UIViewController {
    var webView: WKWebView!
    var url: String?
    
    public init(url: String? = nil) {
        super.init(nibName: "", bundle: nil)
        self.url = url
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let closeButton = UIBarButtonItem(
            image: UIImage(named: "icon-cross", in: Bundle.module, compatibleWith: .none),
            style: .plain,
            target: self,
            action: #selector(handleClose)
        )
        navigationItem.leftBarButtonItem = closeButton
        navigationItem.leftBarButtonItem?.tintColor = UIColor(red: 0.341, green: 0.365, blue: 0.396, alpha: 1)
        
        if let url = Bundle.module.url(forResource: url, withExtension: "html") {
            webView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
        }
    }
}

// MARK: User Action
extension XWebView {
    @objc func handleClose() {
        dismiss(animated: true, completion: nil)
    }
}
