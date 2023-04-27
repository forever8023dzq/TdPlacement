//
//  EarlyWithdrawalService.swift
//  
//
//  Created by Damon Ng on 4/10/22.
//

import Foundation

protocol EarlyWithdrawalServiceProtocol {
    func withdrawalRetrieve(request: WithdrawalRetrieveRequest,
                            completion: @escaping (Result<WithdrawalRetrieveResponse, Error>) -> Void)
    
    func accountsRetrieve(completion: @escaping (Result<AccountsRetrieveResponse, Error>) -> Void)
}

public class EarlyWithdrawalService: EarlyWithdrawalServiceProtocol {
    public init() {}
    
    func withdrawalRetrieve(request: WithdrawalRetrieveRequest, completion: @escaping (Result<WithdrawalRetrieveResponse, Error>) -> Void) {
        ServiceManager.withdrawalRetrieve(request: WithdrawalRetrieveRequestDTO.map(request: request)) { result in
            switch result {
            case .success(let response):
                completion(.success(WithdrawalRetrieveResponse.map(response: response.data)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func accountsRetrieve(completion: @escaping (Result<AccountsRetrieveResponse, Error>) -> Void) {
        ServiceManager.accountsRetrieve() { result in
            switch result {
            case .success(let response):
                completion(.success(AccountsRetrieveResponse.map(response: response.data)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
