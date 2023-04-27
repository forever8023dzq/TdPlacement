//
//  File.swift
//  
//
//  Created by Apple on 2023/4/17.
//

import Foundation

public protocol PlacementServiceProtocol {
    func getEntryData(request: EntryDataRequest,
                            completion: @escaping (Result<EntryDataResponse, Error>) -> Void)
    
    func getAccountData(completion: @escaping (Result<TDAccountsRetrieveResponse, Error>) -> Void)
}

public class PlacementService: PlacementServiceProtocol {
    
    public init() {}
    
    public func getEntryData(request: EntryDataRequest, completion: @escaping (Result<EntryDataResponse, Error>) -> Void) {
        ServiceManager.getEntryData(request: EntryDataRequestDTO.map(request: request)) { result in
            switch result {
            case .success(let response):
                completion(.success(EntryDataResponse.map(response: response.data)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func getAccountData(completion: @escaping (Result<TDAccountsRetrieveResponse, Error>) -> Void) {
//        ServiceManager.accountsRetrieve() { result in
//            switch result {
//            case .success(let response):
//                completion(.success(TDAccountsRetrieveResponse.map(response: response.data)))
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
        let casa1 = AccountsRetrieveResponseDTO.CasaAccount(accTokenId: "12341",accountNo: "5551211", formattedAccountNo: "3131-311", productName: "360 Account", remainingBalance: 5000, currencyType: "SGD")
        let casa2 = AccountsRetrieveResponseDTO.CasaAccount(accTokenId: "12342",accountNo: "213414121", formattedAccountNo: "213-414-132", productName: "360 Account", remainingBalance: 6000, currencyType: "SGD")
        
        let casa3 = AccountsRetrieveResponseDTO.CasaAccount(accTokenId: "12343",accountNo: "333333", formattedAccountNo: "333-33-222", productName: "360 Account", remainingBalance: 6000, currencyType: "SGD")
        
        let td1 = AccountsRetrieveResponseDTO.TDAccount(accTokenId: "1231411", accountNo: "1424531", formattedAccountNo: "3232-4354-55", productName: "Time Deposit", acName1: "kevin1", accountType: TDAccountType.TDP)
        
        let td2 = AccountsRetrieveResponseDTO.TDAccount(accTokenId: "1231412", accountNo: "1424531", formattedAccountNo: "222-222-222", productName: "Time Deposit", acName1: "kevin2", accountType: TDAccountType.TDP)
        
        let td3 = AccountsRetrieveResponseDTO.TDAccount(accTokenId: "1231413", accountNo: "1424531", formattedAccountNo: "341-4444-444", productName: "Time Deposit", acName1: "kevin3", accountType: TDAccountType.TDP)
        
        let response: AccountsRetrieveResponseDTO = AccountsRetrieveResponseDTO(casas: [casa1,casa2,casa3] ,tds: [td1,td2,td3])
        completion(.success(TDAccountsRetrieveResponse.map(response: response)))
    }
}
