//
//  AvailableBalance.swift
//  
//
//  Created by Apple on 2023/4/17.
//

import Foundation
public struct AvailableBalance {
    public var balance: Double
    public var formatedBalance: String
    public var isShowBalance: Bool
    public var currency: Currency
    
    public init(
        balance: Double,
        formatedBalance: String,
        isShowBalance: Bool,
        currency: Currency
    ) {
        self.balance = balance
        self.formatedBalance = formatedBalance
        self.isShowBalance = isShowBalance
        self.currency = currency
    }
}
