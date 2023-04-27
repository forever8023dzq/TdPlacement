//
//  EarlyWithdrawalSuccessViewModel.swift
//  
//
//  Created by Damon Ng on 7/10/22.
//

import Foundation

public struct EarlyWithdrawalSuccessViewModel {
    var withdrawalAmount: Observable<Amount> = Observable(Amount(value: 0, currency: .none))
    var creditTo: Observable<Account?> = Observable(.none)
    
    public init(withdrawalAmount: Amount, creditTo: Account?) {
        self.withdrawalAmount.value = withdrawalAmount
        self.creditTo.value = creditTo
    }
}
