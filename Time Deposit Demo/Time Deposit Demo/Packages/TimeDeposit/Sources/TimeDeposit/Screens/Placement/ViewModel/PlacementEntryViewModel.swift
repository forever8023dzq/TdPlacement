//
//  PlacementEntryViewModel.swift
//  
//
//  Created by Apple on 2023/4/17.
//

import Foundation
public final class PlacementEntryViewModel {
     
    public let placementService: PlacementServiceProtocol
    public var tdType: TDType
   
    
    public var exchangeRate: Observable<Double> = Observable(1)
    
    public private(set) var state: Observable<PlacementStatte> = Observable(.none)
    public var currency: Observable<Currency> = Observable(.SGD)
    public var minimumAmount: Observable<Amount> = Observable(Amount(value: 0, currency: .SGD))
    public var tenor: Observable<Tenor?> = Observable(.none)
    public private(set) var tenors: Observable<[TenorItem]> = Observable([TenorItem]())
    public var tenorStatus: Observable<TenorStatus> = Observable(.noTenor)
    public var amount: Observable<Double> = Observable(0)
    public var promo: Observable<Promo> = Observable(Promo(name: "", code: "", isError: false, errorMsg: ""))
    public var fromAccount: Observable<CasaAccount?> = Observable(.none)
    public private(set) var fromAccounts: Observable<[CasaAccount]> = Observable([CasaAccount]())
    public var isFromChangeBtnHidden: Observable<Bool> = Observable(true)
    public var toAccount: Observable<TDAccount?> = Observable(.none)
    public private(set) var toAccounts: Observable<[TDAccount]> = Observable([TDAccount]())
    public var isToChangeBtnHidden: Observable<Bool> = Observable(true)
    public var availableBalance: Observable<AvailableBalance> = Observable(AvailableBalance(balance: 0, formatedBalance: "0.00", isShowBalance: false, currency: .SGD))
    public var validaion: Observable<Validation> = Observable(Validation(amountError: false, isTenorClikable: false, isPromoClikable: false, amountMsg: "", fromAccountError: false, continueBtn: false))
      
    
    public init(placementService: PlacementServiceProtocol, tdType: TDType) {
        self.placementService = placementService
        self.tdType = tdType
    }
    
    func loadFromAccountList() {
        self.state.value = .loading
        placementService.getAccountData() { result in
            switch result {
            case .success(let response):
                var filteredAccounts: [CasaAccount]
                var filteredTds: [TDAccount]
                if self.tdType == TDType.LCY {
                    filteredAccounts = response.casas.filter { $0.currencyType == .SGD }
                    filteredTds = response.tds.filter{ $0.accountType == .TDP}
                } else {
                    filteredAccounts = response.casas.filter { $0.currencyType != .SGD }
                    filteredTds = response.tds.filter{ $0.accountType == .GTD }
                }
                
                if filteredAccounts.count < 1 {
                    debugPrint("no casa account available")
                } else {
                    
                    self.isFromChangeBtnHidden.value = filteredAccounts.count == 1
                    self.fromAccounts.value = filteredAccounts.map({
                        return $0
                    })
                    var defaultAccount: CasaAccount
                    if let account = filteredAccounts.filter({ $0.account.accTokenId != "" }).first {
                        defaultAccount = account
                        self.updateSelectedCasaAccount(account: defaultAccount ,isCheck: false)
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        self.state.value = .none
                    }
                }
                
                //td
                if filteredTds.count < 1 {
                    debugPrint("no td account available")
                } else {
                    self.isToChangeBtnHidden.value = filteredTds.count == 1
                    self.toAccounts.value = filteredTds.map({
                        return $0
                    })
                    var defaultAccount: TDAccount
                    if let account = filteredTds.filter({ $0.account.accTokenId != "" }).first {
                        defaultAccount = account
                        self.updateSelectedTdAccount(account: defaultAccount)
                    }
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
    
    func updateSelectedCasaAccount(account: CasaAccount ,isCheck: Bool) {
        self.fromAccount.value = account
        self.availableBalance.value = AvailableBalance(balance: account.balance, formatedBalance: account.balance.formattedValue(), isShowBalance: false, currency: account.currencyType)
        if isCheck {
            validate()
        }
//        if self.validaion.value.isPromoClikable {
//            tenorRetrieve()
//        } else {
//            resetPromo()
//            resetTenor()
//        }
        
    }

    
    func updateSelectedTdAccount(account: TDAccount) {
        self.toAccount.value = account
    }
    
    func updateSelectedTenor(tenor: Tenor) {
        self.tenor.value = tenor
        validate()
    }
    
    func checkPromo() {
        debugPrint("checkPromo")
        //let amountStr = String(format: "%.2f", self.amount)
        let request: PromoCheckRequest = PromoCheckRequest(promoCode: self.promo.value.code, amount: String(self.amount.value), currencyCode: self.currency.value)
        // request to check promo code
        let response: PromoCheckResponse = PromoCheckResponse(term: "1", currency: .SGD, termCd: "M", interestRate: "0.34", promoCode: "PROMO")
        
        if request.promoCode == "QQ" {
            //success
            let promo: Promo = Promo(name: response.promoCode, code: response.promoCode, isError: false, errorMsg: "")
            let tenor: Tenor = Tenor(term: response.term, termCd: response.termCd, interestRate: response.interestRate, valueDate: "")
            self.promo.value = promo
            self.tenorStatus.value = .promoTenor
            self.tenor.value = tenor
            let validaion: Validation = Validation(amountError: false, isTenorClikable: false, isPromoClikable: true, amountMsg: "", fromAccountError: false, continueBtn: true)
            self.validaion.value = validaion
        } else {
            //error
            let promp: Promo = Promo(name: "", code: "", isError: true, errorMsg: "Please enter a valid promo code")
            self.promo.value = promp
            let validaion: Validation = Validation(amountError: false, isTenorClikable: false, isPromoClikable: true, amountMsg: "", fromAccountError: false, continueBtn: false)
            self.validaion.value = validaion
        }
    }
    
    
    func loadData() {
        //call ms-account to get casa data
        //call entry-rate to get minimum data and exchange rate
        let amount: Amount = Amount(value: 5010, currency: .SGD)
        self.minimumAmount.value = amount
        self.exchangeRate.value = 1
        print("loadData")
        
    }
    
    public func validate() {
        var validation: Validation
        if amount.value < minimumAmount.value.value {
            let amountMsg = "A minimum " + self.minimumAmount.value.value.formattedValue() + " " + self.minimumAmount.value.currency.rawValue + " is required"
            validation = Validation(
                amountError: true,
                isTenorClikable: false,
                isPromoClikable: false,
                amountMsg: amountMsg,
                fromAccountError: false,
                continueBtn: false
            )
        } else if availableBalance.value.balance < amount.value {
            validation = Validation(
                amountError: true,
                isTenorClikable: false,
                isPromoClikable: false,
                amountMsg: "You do not have sufficient funds",
                fromAccountError: true,
                continueBtn: false
            )
        } else {
            let flagContinueBtn = fromAccount.value != nil && toAccount.value != nil && !validaion.value.amountError && !validaion.value.fromAccountError && tenor.value != nil
            let flagTenor = tenorStatus.value != .promoTenor && tenors.value.count > 0
            validation = Validation(
                amountError: false,
                isTenorClikable: flagTenor,
                isPromoClikable: true,
                amountMsg: "",
                fromAccountError: false,
                continueBtn: flagContinueBtn
            )
            if !self.validaion.value.isPromoClikable {
                validation.isTenorClikable = true
                tenorRetrieve()
            }
        }
        if !validation.isPromoClikable {
            resetTenor()
            resetPromo()
        }
        self.validaion.value = validation
    }
    

    public func resetTenor() {
        // need to resst tenor and
        self.tenors.value = []
        self.tenor.value = .none
        self.tenorStatus.value = .noTenor
    }
    
    public func resetPromo() {
        let promo: Promo = Promo(name: "", code: "", isError: false, errorMsg: "" )
        self.promo.value = promo
    }
    
    
    public func tenorRetrieve() {
        debugPrint("tenorRetrieve")
        
        let tenor1 = Tenor(term: "3", termCd: "M", interestRate: "0.18", valueDate: "2023-04-20")
        let tenor2 = Tenor(term: "4", termCd: "M", interestRate: "0.2", valueDate: "2023-04-20")
        let tenorItem1 = TenorItem(tenor: tenor1)
        let tenorItem2 = TenorItem(tenor: tenor2)
        self.tenors.value = [tenorItem1 ,tenorItem2]
    }
}

extension PlacementEntryViewModel {
    public class TenorItem {
        // MARK: - OUTPUT
        public let tenor: Tenor
        public let termDesc: String
        public let interestRateDesc: String
        
        init(tenor: Tenor) {
            self.tenor = tenor
            self.termDesc = tenor.getTermDesc()
            self.interestRateDesc = tenor.getInterestRateDescForList()
        }
    }
    
    
}
