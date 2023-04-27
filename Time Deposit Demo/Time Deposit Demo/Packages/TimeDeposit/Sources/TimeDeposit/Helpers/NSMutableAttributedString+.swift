//
//  NSMutableAttributedString+.swift
//  
//
//  Created by Damon Ng on 5/10/22.
//

import UIKit

extension NSMutableAttributedString {
    // Replaces the font in an attributed string without affecting other attributes
    func replaceFont(with font: UIFont, color: UIColor, keepSize: Bool = false) {
        beginEditing()
        enumerateAttribute(.font, in: NSRange(location: 0, length: length)) { value, range, _ in
            if let attributeFont = value as? UIFont, let ufd = attributeFont.fontDescriptor
                .withFamily(font.familyName)
                .withSymbolicTraits(attributeFont.fontDescriptor.symbolicTraits) {
                let newFont = UIFont(descriptor: ufd, size: keepSize ? attributeFont.pointSize : font.pointSize)
                removeAttribute(.font, range: range)
                addAttribute(.font, value: newFont, range: range)
                addAttribute(.foregroundColor, value: color, range: range)
            }
        }
        endEditing()
    }

    // Replaces links in the attributed string with the given font
    func replaceLinkFont(with font: UIFont) {
        beginEditing()
        enumerateAttribute(.link, in: NSRange(location: 0, length: length)) { value, range, _ in
            if value != nil {
                removeAttribute(NSAttributedString.Key.font, range: range)
                addAttribute(NSAttributedString.Key.font, value: font, range: range)
            }
        }
        endEditing()
    }
}
