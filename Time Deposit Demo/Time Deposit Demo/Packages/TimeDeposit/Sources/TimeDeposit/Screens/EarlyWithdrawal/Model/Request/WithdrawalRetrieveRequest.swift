//
//  File.swift
//  
//
//  Created by Damon Ng on 4/10/22.
//

import Foundation

public struct WithdrawalRetrieveRequest {
    let accountNo: String
    let accountType: AccountType
    let currencyType: Currency
    let timeDepositNo: Int
}
