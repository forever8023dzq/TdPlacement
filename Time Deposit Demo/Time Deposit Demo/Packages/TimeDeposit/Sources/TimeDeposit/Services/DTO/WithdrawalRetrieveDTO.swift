//
//  WithdrawalRetrieveDTO.swift
//  
//
//  Created by Damon Ng on 3/10/22.
//

import Foundation

public struct WithdrawalRetrieveRequestDTO {
    let accountNo: String
    let accountType: AccountType
    let currencyType: Currency
    let timeDepositNo: Int
}

extension WithdrawalRetrieveRequestDTO {
    static func map(request: WithdrawalRetrieveRequest) -> WithdrawalRetrieveRequestDTO {
        return WithdrawalRetrieveRequestDTO(
            accountNo: request.accountNo,
            accountType: request.accountType,
            currencyType: request.currencyType,
            timeDepositNo: request.timeDepositNo
        )
    }
}

public struct WithdrawalRetrieveResponseDTO: Codable {
    let timeDepositDetail: TimeDepositDetail
    let timeDepositAdviseDetail: TimeDepositAdviseDetail
    
    struct TimeDepositDetail: Codable {
        let timeDepositAccountDetail: TimeDepositAccountDetail
        
        struct TimeDepositAccountDetail: Codable {
            let accountKeyDetail: AccountKeyDetail
            
            struct AccountKeyDetail: Codable {
                let accountNo: String
                let accountType: AccountType
                let currencyType: Currency
            }
        }
    }
    
    struct TimeDepositAdviseDetail: Codable {
        let timeDepositAdvisePrimaryDetail: TimeDepositAdvisePrimaryDetail
        let timeDepositAdviseInterestDetail: TimeDepositAdviseInterestDetail
        
        struct TimeDepositAdvisePrimaryDetail: Codable {
            let netSettlementAmt: Double
            let originalBalance: Double
            let ytdInterestPenalty: Double
            let maturityDate: String
        }
        
        struct TimeDepositAdviseInterestDetail: Codable {
            let interestAvailAmount: Double
        }
    }
}
