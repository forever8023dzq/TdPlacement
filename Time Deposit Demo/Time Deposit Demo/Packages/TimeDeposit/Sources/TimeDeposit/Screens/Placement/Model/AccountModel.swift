//
//  AccountModel.swift
//  
//
//  Created by Apple on 2023/4/23.
//

import Foundation

public struct AccountModel {
    public let accTokenId: String
    public let accountName: String
    public let accountNo: String
    public let formattedAccountNo: String
  
    
    public init(
        accTokenId: String,
        accountName: String,
        accountNo: String,
        formattedAccountNo: String
    ) {
        self.accTokenId = accTokenId
        self.accountName = accountName
        self.accountNo = accountNo
        self.formattedAccountNo = formattedAccountNo
    }
}
