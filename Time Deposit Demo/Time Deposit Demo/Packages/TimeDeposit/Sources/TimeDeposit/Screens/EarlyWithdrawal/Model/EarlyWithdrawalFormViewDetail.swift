//
//  EarlyWithdrawalFormViewDetail.swift
//  
//
//  Created by Damon Ng on 4/10/22.
//

import Foundation

public struct EarlyWithdrawalFormViewDetail {
    let withdrawalAmount: Amount
    let principalAmount: Amount
    let interest: Amount
    let interestInfoTipText: String
    let earlyWithdrawalFee: Amount
    let withdrawFrom: String
    let receiptInfo: TimeDepositReceipt?
    let creditTo: Account?
    let isEarlyWithdrawalFeeHidden: Bool
    let showUsdAsNewCurrencyInfoTip: Bool
    
    public init(viewModel: EarlyWithdrawalFormViewModel) {
        self.withdrawalAmount = viewModel.withdrawalAmount.value
        self.principalAmount = viewModel.principalAmount.value
        self.interest = viewModel.interest.value
        self.interestInfoTipText = viewModel.interestInfoTipText.value
        self.earlyWithdrawalFee = viewModel.earlyWithdrawalFee.value
        self.withdrawFrom = viewModel.withdrawFrom.value
        self.receiptInfo = viewModel.receiptInfo.value
        self.creditTo = viewModel.creditTo.value
        self.isEarlyWithdrawalFeeHidden = viewModel.isEarlyWithdrawalFeeHidden.value
        self.showUsdAsNewCurrencyInfoTip = viewModel.showUsdAsNewCurrencyInfoTip.value
    }
}
