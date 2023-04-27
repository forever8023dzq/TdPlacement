//
//  TDAccountsRetrieveResponse.swift
//  
//
//  Created by Apple on 2023/4/17.
//

import Foundation

public struct TDAccountsRetrieveResponse {
    let casas: [CasaAccount]
    let tds: [TDAccount]
}

extension TDAccountsRetrieveResponse {
    static func map(response: AccountsRetrieveResponseDTO) -> TDAccountsRetrieveResponse {
        return TDAccountsRetrieveResponse(
            casas: response.casas.map { casa in
                var shortName: String
                switch casa.productName {
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
                
                return CasaAccount(
                    account: AccountModel(
                        accTokenId: casa.accTokenId,
                        accountName: casa.productName,
                        accountNo: casa.accountNo,
                        formattedAccountNo: casa.formattedAccountNo),
                    balance: casa.remainingBalance,
                    accountShortName: shortName,
                    currencyType: Currency(rawValue: casa.currencyType) ?? .SGD
                )
            },
            tds: response.tds.map { td in
                return TDAccount(
                    account: AccountModel(
                        accTokenId: td.accTokenId,
                        accountName: td.productName,
                        accountNo: td.accountNo,
                        formattedAccountNo: td.formattedAccountNo),
                    userName: td.acName1,
                    accountType: td.accountType
                )
            }
        )
    }
}
