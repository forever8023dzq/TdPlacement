//
//  TDAccount.swift
//  
//
//  Created by Apple on 2023/4/17.
//

import Foundation
public struct TDAccount {
    public let account: AccountModel
    public let userName: String
    public let accountType: TDAccountType
    
    public init(
        account: AccountModel,
        userName: String,
        accountType: TDAccountType
    ) {
        self.account = account
        self.userName = userName
        self.accountType = accountType
    } 
    
}

