//
//  TextStyle.swift
//  
//
//  Created by Damon Ng on 5/10/22.
//

import UIKit

public struct TextStyle {
    public var font: UIFont
    public var color: UIColor
    public var lineHeight: CGFloat
    
    public static let OpenSans_Regular_12 = TextStyle(font: UIFont(name: "OpenSans-Regular", size: 12)!, color: UIColor(red: 0.467, green: 0.494, blue: 0.529, alpha: 1), lineHeight: 16)
    public static let OpenSans_Regular_14 = TextStyle(font: UIFont(name: "OpenSans-Regular", size: 14)!, color: UIColor(red: 0.467, green: 0.494, blue: 0.529, alpha: 1), lineHeight: 20)
    public static let OpenSans_Regular_16 = TextStyle(font: UIFont(name: "OpenSans-Regular", size: 16)!, color: UIColor(red: 0.467, green: 0.494, blue: 0.529, alpha: 1), lineHeight: 24)
    public static let OpenSans_SemiBold_12 = TextStyle(font: UIFont(name: "OpenSans-SemiBold", size: 12)!, color: UIColor(red: 0.341, green: 0.365, blue: 0.396, alpha: 1), lineHeight: 16)
    public static let OpenSans_SemiBold_16 = TextStyle(font: UIFont(name: "OpenSans-SemiBold", size: 16)!, color: UIColor(red: 0.341, green: 0.365, blue: 0.396, alpha: 1), lineHeight: 24)
    public static let OpenSans_Bold_16 = TextStyle(font: UIFont(name: "OpenSans-Bold", size: 16)!, color: UIColor(red: 0.341, green: 0.365, blue: 0.396, alpha: 1), lineHeight: 24)
    public static let OpenSans_Bold_20_Header = TextStyle(font: UIFont(name: "OpenSans-Bold", size: 20)!, color: UIColor(red: 0.212, green: 0.231, blue: 0.251, alpha: 1), lineHeight: 28)
    public static let OpenSans_Bold_24 = TextStyle(font: UIFont(name: "OpenSans-Bold", size: 24)!, color: UIColor(red: 0.341, green: 0.365, blue: 0.396, alpha: 1), lineHeight: 32)
    public static let OpenSans_Bold_24_Header = TextStyle(font: UIFont(name: "OpenSans-Bold", size: 24)!, color: UIColor(red: 0.212, green: 0.231, blue: 0.251, alpha: 1), lineHeight: 32)
    public static let OpenSans_Regular_Link = TextStyle(font: UIFont(name: "OpenSans-Regular", size: 12)!, color: UIColor(red: 0.467, green: 0.494, blue: 0.529, alpha: 1), lineHeight: 20)
    public static let OpenSans_SemiBold_HTML_Header = TextStyle(font: UIFont(name: "OpenSans-SemiBold", size: 16)!, color: UIColor(red: 0.212, green: 0.231, blue: 0.251, alpha: 1), lineHeight: 24)
    
    public static let OpenSans_Regular_14_blue = TextStyle(font: UIFont(name: "OpenSans-Regular", size: 14)!, color: UIColor(red: 0, green: 0.369, blue: 0.992, alpha: 1), lineHeight: 20)
    
    public static let OpenSans_Bold_12 = TextStyle(font: UIFont(name: "OpenSans-Bold", size: 12)!, color: UIColor(red: 0.467, green: 0.494, blue: 0.529, alpha: 1), lineHeight: 16)
    
    
    public static let error_color = UIColor(red: 0.929, green: 0.325, blue: 0.278, alpha: 1)
}
