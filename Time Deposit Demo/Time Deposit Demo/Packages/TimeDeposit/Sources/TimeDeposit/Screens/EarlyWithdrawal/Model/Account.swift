//
//  Account.swift
//  
//
//  Created by Damon Ng on 30/9/22.
//

public struct Account {
    public let accountName: String
    public let accountShortName: String
    public let accountNo: String
    public let formattedAccountNo: String
    public let currencyType: Currency
    
    public init(
        accountName: String,
        accountShortName: String,
        accountNo: String,
        formattedAccountNo: String,
        currencyType: Currency
    ) {
        self.accountName = accountName
        self.accountShortName = accountShortName
        self.accountNo = accountNo
        self.formattedAccountNo = formattedAccountNo
        self.currencyType = currencyType
    }
}
