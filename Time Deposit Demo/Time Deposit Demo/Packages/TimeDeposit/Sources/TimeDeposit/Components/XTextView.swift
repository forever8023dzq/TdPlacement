//
//  XTextView.swift
//  
//
//  Created by Damon Ng on 6/10/22.
//

import UIKit

public class XTextView: UITextView, UITextViewDelegate {
    public typealias XTextViewLinkHandler = (URL) -> Bool
    var linkHandler: XTextViewLinkHandler?
    
    public override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup() {
        delegate = self
        font = UIFont(name: "OpenSans-Regular", size: 12)
        
        translatesAutoresizingMaskIntoConstraints = false
        isScrollEnabled = false
        isEditable = false
        
        backgroundColor = .clear
        let inset = textContainer.lineFragmentPadding
        textContainerInset = UIEdgeInsets(top: textContainerInset.top, left: -inset, bottom: textContainerInset.bottom, right: -inset)
    }
    
    public func textView(_ textView: UITextView, shouldInteractWith url: URL, in characterRange: NSRange) -> Bool {
        if let linkHandler = linkHandler {
            if linkHandler(url) {
                return false
            }
        }
        UIApplication.shared.open(url)
        // Disable `.preview` by 3D Touch and other interactions
        return false
    }
    
    @discardableResult
    func html(html: String,
              textStyle: TextStyle? = TextStyle.OpenSans_Regular_14,
              linkStyle: TextStyle? = TextStyle.OpenSans_Regular_Link,
              handler: XTextViewLinkHandler?
    ) -> XTextView {
        guard let mutableString = try? NSMutableAttributedString(
            data: Data(html.utf8),
            options: [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
            ],
            documentAttributes: nil
        ) else {
            return self
        }
        if let textStyleFont = textStyle?.font,
           let textStyleColor = textStyle?.color {
            mutableString.replaceFont(with: textStyleFont, color: textStyleColor, keepSize: false)
        }
        
        if let linkStyle = linkStyle {
            linkTextAttributes = [
                .underlineStyle: 0,
                NSAttributedString.Key.underlineColor: UIColor.clear,
                NSAttributedString.Key.foregroundColor: linkStyle.color
            ]
            mutableString.replaceLinkFont(with: linkStyle.font)
        }
        attributedText = mutableString
        if let textStyle = textStyle {
            lineHeight(height: textStyle.lineHeight)
        }
        linkHandler = handler
        return self
    }
    
    @discardableResult
    public func lineHeight(height: CGFloat, indent: CGFloat? = nil) -> XTextView {
        guard let mutableString =
                attributedText?.mutableCopy() as? NSMutableAttributedString else { return self }
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 0
        paragraphStyle.maximumLineHeight = height
        paragraphStyle.minimumLineHeight = height
        if let indent = indent {
            paragraphStyle.tabStops = [
                NSTextTab(textAlignment: .left, location: 1, options: [:])
            ]
            paragraphStyle.defaultTabInterval = indent
            paragraphStyle.firstLineHeadIndent = 0
            paragraphStyle.headIndent = indent
        }
        let range = NSRange(location: 0, length: (text ?? "").count)
        mutableString.addAttribute(.paragraphStyle, value: paragraphStyle, range: range)
        attributedText = mutableString
//        // TODO: Ensure that this calculation is correct
        let insetPadding = textContainer.lineFragmentPadding
        textContainerInset = UIEdgeInsets(
            top: (font?.pointSize ?? 0) - height,
            left: -insetPadding,
            bottom: 0,
            right: -insetPadding
        )
        return self
    }
}
