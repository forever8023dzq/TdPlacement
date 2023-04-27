//
//  MISelectViewModel.swift
//  
//
//  Created by Apple on 2023/4/20.
//

import Foundation
public final class MISelectViewModel {
   
    
    public private(set) var state: Observable<State> = Observable(.none)
  
    

    public var miType: Observable<String> = Observable("")

    public var creditToAccount: Observable<CasaAccount?> = Observable(.none)
    public private(set) var creditToAccounts: Observable<[CasaAccount]> = Observable([CasaAccount]())
    
    
    
    public init(accounts: [CasaAccount]) {
        self.creditToAccounts.value = accounts
        updateSelectedCreditAccount(account: accounts.first)
    }
    
    func updateSelectedCreditAccount(account: CasaAccount?) {
        self.creditToAccount.value = account
    }
    
}

