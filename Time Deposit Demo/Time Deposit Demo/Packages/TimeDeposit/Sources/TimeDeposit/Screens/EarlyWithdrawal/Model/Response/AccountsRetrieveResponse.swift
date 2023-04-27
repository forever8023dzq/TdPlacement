//
//  AccountsRetrieveResponse.swift
//  
//
//  Created by Damon Ng on 4/10/22.
//

import Foundation

public struct AccountsRetrieveResponse {
    let accounts: [Account]
}

extension AccountsRetrieveResponse {
    static func map(response: AccountsRetrieveResponseDTO) -> AccountsRetrieveResponse {
        return AccountsRetrieveResponse(
            accounts: response.casas.map { account in
                var shortName: String
                switch account.productName {
                case "Statement Savings Account":
                    shortName = "SSA"
                case "FRANK Savings Account":
                    shortName = "FRK"
                case "360 Account":
                    shortName = "360"
                case "Global Savings Account":
                    shortName = "GSA"
                default:
                    shortName = ""
                }
                return Account(
                    accountName: account.productName,
                    accountShortName: shortName,
                    accountNo: account.accountNo,
                    formattedAccountNo: account.formattedAccountNo,
                    currencyType: Currency(rawValue: account.currencyType) ?? .SGD
                )
            }
        )
    }
}
