//
//  EarlyWithdrawalReviewViewModel.swift
//  
//
//  Created by Damon Ng on 4/10/22.
//

import Foundation

public final class EarlyWithdrawalReviewViewModel {
    var withdrawalAmount: Observable<Amount> = Observable(Amount(value: 0, currency: .none))
    var principalAmount: Observable<Amount> = Observable(Amount(value: 0, currency: .none))
    var interest: Observable<Amount> = Observable(Amount(value: 0, currency: .none))
    var interestInfoTipText: Observable<String> = Observable("")
    var earlyWithdrawalFee: Observable<Amount> = Observable(Amount(value: 0, currency: .none))
    var withdrawFrom: Observable<String> = Observable("")
    var receiptInfo: Observable<TimeDepositReceipt?> = Observable(.none)
    var creditTo: Observable<Account?> = Observable(.none)
    var isEarlyWithdrawalFeeHidden: Observable<Bool> = Observable(true)
    var showUsdAsNewCurrencyInfoTip: Observable<Bool> = Observable(false)
    
    init(earlyWithdrawalFormViewDetail: EarlyWithdrawalFormViewDetail) {
        self.withdrawalAmount.value = earlyWithdrawalFormViewDetail.withdrawalAmount
        self.principalAmount.value = earlyWithdrawalFormViewDetail.principalAmount
        self.interest.value = earlyWithdrawalFormViewDetail.interest
        self.interestInfoTipText.value = earlyWithdrawalFormViewDetail.interestInfoTipText
        self.earlyWithdrawalFee.value = earlyWithdrawalFormViewDetail.earlyWithdrawalFee
        self.withdrawFrom.value = earlyWithdrawalFormViewDetail.withdrawFrom
        self.receiptInfo.value = earlyWithdrawalFormViewDetail.receiptInfo
        self.creditTo.value = earlyWithdrawalFormViewDetail.creditTo
        self.isEarlyWithdrawalFeeHidden.value = earlyWithdrawalFormViewDetail.isEarlyWithdrawalFeeHidden
        self.showUsdAsNewCurrencyInfoTip.value = earlyWithdrawalFormViewDetail.showUsdAsNewCurrencyInfoTip
    }
}
