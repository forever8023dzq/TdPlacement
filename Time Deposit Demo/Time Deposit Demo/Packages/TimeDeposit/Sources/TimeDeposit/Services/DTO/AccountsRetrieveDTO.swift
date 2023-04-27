//
//  AccountRetrieveDTO.swift
//  
//
//  Created by Damon Ng on 3/10/22.
//

import Foundation

public struct AccountsRetrieveRequestDTO: Codable {
    
}

public struct AccountsRetrieveResponseDTO: Codable {
    let casas: [CasaAccount]
    let tds: [TDAccount]
    
    struct CasaAccount: Codable {
        let accTokenId: String
        let accountNo: String
        let formattedAccountNo: String
        let productName: String
        let remainingBalance: Double
        let currencyType: String
    }
    
    struct TDAccount: Codable {
        let accTokenId: String
        let accountNo: String
        let formattedAccountNo: String
        let productName: String
        let acName1: String
        let accountType: TDAccountType
    }
}
