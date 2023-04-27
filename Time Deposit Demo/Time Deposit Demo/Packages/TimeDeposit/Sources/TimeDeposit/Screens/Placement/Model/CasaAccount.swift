//
//  CasaAccount.swift
//  
//
//  Created by Apple on 2023/4/23.
//

import Foundation
public struct CasaAccount {
    public let account: AccountModel
    public let balance: Double
    public let accountShortName: String
    public let currencyType: Currency
    
    public init(
        account: AccountModel,
        balance: Double,
        accountShortName: String,
        currencyType: Currency
    ) {
        self.account = account
        self.balance = balance
        self.accountShortName = accountShortName
        self.currencyType = currencyType
    }
}
