//
//  WithdrawalRetrieveResponse.swift
//  
//
//  Created by Damon Ng on 4/10/22.
//

import Foundation

public struct WithdrawalRetrieveResponse {
    let withdrawalAmount: Amount
    let principalAmount: Amount
    let interest: Amount
    let currency: Currency
    let earlyWithdrawalFee: Amount
    let maturityDate: String
}

extension WithdrawalRetrieveResponse {
    static func map(response: WithdrawalRetrieveResponseDTO) -> WithdrawalRetrieveResponse {
        return WithdrawalRetrieveResponse(
            withdrawalAmount: Amount(
                value: response.timeDepositAdviseDetail.timeDepositAdvisePrimaryDetail.netSettlementAmt,
                currency: response.timeDepositDetail.timeDepositAccountDetail.accountKeyDetail.currencyType
            ),
            principalAmount: Amount(
                value: response.timeDepositAdviseDetail.timeDepositAdvisePrimaryDetail.originalBalance,
                currency: response.timeDepositDetail.timeDepositAccountDetail.accountKeyDetail.currencyType
            ),
            interest: Amount(
                value: response.timeDepositAdviseDetail.timeDepositAdviseInterestDetail.interestAvailAmount,
                currency: response.timeDepositDetail.timeDepositAccountDetail.accountKeyDetail.currencyType
            ),
            currency: response.timeDepositDetail.timeDepositAccountDetail.accountKeyDetail.currencyType,
            earlyWithdrawalFee: Amount(
                value: response.timeDepositAdviseDetail.timeDepositAdvisePrimaryDetail.ytdInterestPenalty,
                currency: response.timeDepositDetail.timeDepositAccountDetail.accountKeyDetail.currencyType
            ),
            maturityDate: response.timeDepositAdviseDetail.timeDepositAdvisePrimaryDetail.maturityDate.date(inputFormat: .yyyy_MM_dd, outputFormat: .dd_MMM_yyyy)
        )
    }
}
