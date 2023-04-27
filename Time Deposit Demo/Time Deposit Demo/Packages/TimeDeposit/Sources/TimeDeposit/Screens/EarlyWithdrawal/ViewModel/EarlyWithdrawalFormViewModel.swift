//
//  EarlyWithdrawInitialViewModel.swift
//  
//
//  Created by Damon Ng on 21/9/22.
//

import Foundation

public final class EarlyWithdrawalFormViewModel {
    private let earlyWithdrawalService: EarlyWithdrawalServiceProtocol
    
    public private(set) var state: Observable<State> = Observable(.none)
    public private(set) var withdrawalAmount: Observable<Amount> = Observable(Amount(value: 0, currency: .none))
    public private(set) var principalAmount: Observable<Amount> = Observable(Amount(value: 0, currency: .none))
    public private(set) var interest: Observable<Amount> = Observable(Amount(value: 0, currency: .none))
    public private(set) var interestInfoTipText: Observable<String> = Observable("")
    public private(set) var earlyWithdrawalFee: Observable<Amount> = Observable(Amount(value: 0, currency: .none))
    public private(set) var withdrawFrom: Observable<String> = Observable("")
    public private(set) var receiptInfo: Observable<TimeDepositReceipt?> = Observable(.none)
    public private(set) var creditTo: Observable<Account?> = Observable(.none)
    public private(set) var isEarlyWithdrawalFeeHidden: Observable<Bool> = Observable(true)
    public private(set) var isChangeButtonHidden: Observable<Bool> = Observable(true)
    public private(set) var showUsdAsNewCurrencyInfoTip: Observable<Bool> = Observable(false)
    public private(set) var accounts: Observable<[Item]> = Observable([Item]())
    public private(set) var showAccountOpenPage: Observable<Bool> = Observable(false)
    
    public var productName: String?
    public var accountNo: String?
    public var accountType: AccountType?
    public var currencyType: Currency?
    public var timeDepositNo: Int?
    public var transactedAcct: String?
    public var transactedAcctType: AccountType?
    
    public init(earlyWithdrawalService: EarlyWithdrawalService = EarlyWithdrawalService()) {
        self.earlyWithdrawalService = earlyWithdrawalService
        let accounta: Account = Account(accountName: "aaa", accountShortName: "sasa", accountNo: "1213331", formattedAccountNo: "21-21-22", currencyType: .AUD)
        let accountb: Account = Account(accountName: "aaa", accountShortName: "sasa", accountNo: "21212", formattedAccountNo: "211-211-212", currencyType: .SGD)
        let itema: Item = Item(account: accounta)
        
        let itemb: Item = Item(account: accountb)
        
        self.accounts.value = [itema , itemb, itema , itemb, itema , itemb]
    }
    
    func loadData() {
        self.state.value = .loading
        
        guard let productName = productName,
              let accountNo = accountNo,
              let accountType = accountType,
              let currencyType = currencyType,
              let timeDepositNo = timeDepositNo
        else {
            return
        }
        
        self.interestInfoTipText.value = currencyType == .SGD ? "You may earn less or no interest if you withdraw your time deposit before maturity. " : "You may earn less or no interest if you withdraw your time deposit before maturity. An early withdrawal fee may also be imposed."
        
        earlyWithdrawalService.withdrawalRetrieve(request: .init(
            accountNo: accountNo,
            accountType: accountType,
            currencyType: currencyType,
            timeDepositNo: timeDepositNo)
        ) { result in
            switch result {
            case .success(let response):
                self.withdrawalAmount.value = response.withdrawalAmount
                self.principalAmount.value = response.principalAmount
                self.interest.value = response.interest
                self.earlyWithdrawalFee.value = response.earlyWithdrawalFee
                self.isEarlyWithdrawalFeeHidden.value = !(response.earlyWithdrawalFee.value > 0)
                self.withdrawFrom.value = productName
                self.receiptInfo.value = TimeDepositReceipt(
                    accountNumber: accountNo,
                    currency: currencyType,
                    receiptNo: timeDepositNo,
                    maturityDate: response.maturityDate
                )
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.state.value = .none
                }
            case .failure(let error):
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.state.value = .error
                }
                print("\(error)")
            }
        }
    }
    
    func loadAccountList() {
        self.state.value = .loading
        
        guard let currencyType = currencyType,
              let transactedAcct = transactedAcct
        else {
            return
        }
        
        earlyWithdrawalService.accountsRetrieve() { result in
            switch result {
            case .success(let response):
                var filteredAccounts: [Account]
                if currencyType == .SGD {
                    filteredAccounts = response.accounts.filter { $0.currencyType == currencyType }
                } else {
                    filteredAccounts = response.accounts.filter { $0.currencyType != .SGD }
                }
                
                if filteredAccounts.count < 1 {
                    self.state.value = .noCasaAccount
                } else {
                    self.accounts.value = filteredAccounts.map({
                        return Item(account: $0)
                    })
                    self.isChangeButtonHidden.value = !(filteredAccounts.count > 1)
                    
                    var defaultAccount: Account
                    if let account = filteredAccounts.filter({ $0.accountNo == transactedAcct }).first {
                        defaultAccount = Account(
                            accountName: account.accountName,
                            accountShortName: account.accountShortName,
                            accountNo: account.accountNo,
                            formattedAccountNo: account.formattedAccountNo,
                            currencyType: account.currencyType
                        )
                    } else {
                        defaultAccount = Account(
                            accountName: filteredAccounts.first?.accountName ?? "",
                            accountShortName: filteredAccounts.first?.accountShortName ?? "",
                            accountNo: filteredAccounts.first?.accountNo ?? "",
                            formattedAccountNo: filteredAccounts.first?.formattedAccountNo ?? "",
                            currencyType: filteredAccounts.first?.currencyType ?? .none
                        )
                    }
                    self.updateSelectedAccount(account: defaultAccount)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        self.state.value = .none
                    }
                }
            case .failure(let error):
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    self.state.value = .error
                }
                print("\(error)")
            }
        }
    }
    
    func updateSelectedAccount(account: Account) {
        self.creditTo.value = account
        self.showUsdAsNewCurrencyInfoTip.value = currencyType != account.currencyType
    }
    
    func tenorRetrieve() {
        debugPrint("tenorRetrieve")
    }
    
}

extension EarlyWithdrawalFormViewModel {
    public class Item {
        // MARK: - OUTPUT
        public let accountShortName: String
        public let accountName: String
        public let accountNo: String
        public let formattedAccountNo: String
        public let currency: Currency
        
        init(account: Account) {
            self.accountShortName = account.accountShortName
            self.accountName = account.accountName
            self.accountNo = account.accountNo
            self.formattedAccountNo = account.formattedAccountNo
            self.currency = account.currencyType
        }
    }
}
