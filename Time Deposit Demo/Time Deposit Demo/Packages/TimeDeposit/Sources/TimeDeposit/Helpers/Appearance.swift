//
//  ComponentConfigManager.swift
//  
//
//  Created by Damon Ng on 23/9/22.
//

import Foundation
import os.log
import UIKit

public struct Appearance {
    /// Configures all the UI of the package
    public static  func configurePackageUI() {
        loadPackageFonts()
    }
    
    static func loadPackageFonts() {
        // All the filenames of your custom fonts here
        let fontNames = [
            "OpenSans-Regular.ttf",
            "OpenSans-SemiBold.ttf",
            "OpenSans-Bold.ttf",
        ]

        fontNames.forEach { registerFont(fileName: $0) }
    }
    
    static func registerFont(fileName: String) {
        guard let pathForResourceString = Bundle.module.path(forResource: fileName, ofType: nil),
              let fontData = NSData(contentsOfFile: pathForResourceString),
              let dataProvider = CGDataProvider(data: fontData),
              let fontRef = CGFont(dataProvider) else {
            os_log("registration failed for font %@", log: .default, type: .error, fileName)
            return
        }

        var errorRef: Unmanaged<CFError>?

        if !CTFontManagerRegisterGraphicsFont(fontRef, &errorRef) {
            os_log("registration failed with error - %@", log: .default, type: .error, errorRef.debugDescription)
        }

        // Useful snippets for debugging registered fonts in the actual app
//        for family: String in UIFont.familyNames
//        {
//            print(family)
//            for names: String in UIFont.fontNames(forFamilyName: family)
//            {
//                print("== \(names)")
//            }
//        }
    }
}
