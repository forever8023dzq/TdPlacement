//
//  Double+.swift
//  
//
//  Created by Damon Ng on 2/10/22.
//

import Foundation

extension Double {
    func formattedValue() -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.currencySymbol = ""
        return currencyFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
