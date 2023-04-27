//
//  Amount.swift
//  
//
//  Created by Damon Ng on 3/10/22.
//

import Foundation

public struct Amount {
    let value: Double
    let currency: Currency
    
    public init(value: Double, currency: Currency) {
        self.value = value
        self.currency = currency
    }
}
