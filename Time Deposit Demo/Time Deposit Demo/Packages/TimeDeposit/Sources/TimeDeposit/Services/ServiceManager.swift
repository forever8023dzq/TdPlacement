//
//  ServiceManager.swift
//  
//
//  Created by Damon Ng on 3/10/22.
//

import Foundation

public class ServiceManager {
    public class func withdrawalRetrieve(request: WithdrawalRetrieveRequestDTO, completion: @escaping (Result<BaseAPIResponse<WithdrawalRetrieveResponseDTO>, EarlyWithdrawalError>) -> Void) {
        let response: BaseAPIResponse<WithdrawalRetrieveResponseDTO>
        do {
            let data: Data
            guard let file = Bundle.module.url(forResource: "withdrawalRetrieve", withExtension: "json") else {
                fatalError("Couldn't find json file")
            }
            data = try Data(contentsOf: file)
            response = try JSONDecoder().decode(BaseAPIResponse<WithdrawalRetrieveResponseDTO>.self, from: data)
        } catch {
            fatalError("Couldn't parse json file")
        }
        completion(.success(response))
    }
    
    public class func accountsRetrieve(completion: @escaping (Result<BaseAPIResponse<AccountsRetrieveResponseDTO>, Error>) -> Void) {
        let response: BaseAPIResponse<AccountsRetrieveResponseDTO>
        do {
            let data: Data
            guard let file = Bundle.module.url(forResource: "noAccount", withExtension: "json") else {
                fatalError("Couldn't find json file")
            }
            data = try Data(contentsOf: file)
            response = try JSONDecoder().decode(BaseAPIResponse<AccountsRetrieveResponseDTO>.self, from: data)
        } catch {
            fatalError("Couldn't parse json file")
        }
        completion(.success(response))
    }
    
    public class func getEntryData(request: EntryDataRequestDTO, completion: @escaping (Result<BaseAPIResponse<EntryDataResponseDTO>, EarlyWithdrawalError>) -> Void) {
        let response: BaseAPIResponse<EntryDataResponseDTO>
        do {
            let data: Data
            guard let file = Bundle.module.url(forResource: "entryData", withExtension: "json") else {
                fatalError("Couldn't find json file")
            }
            data = try Data(contentsOf: file)
            response = try JSONDecoder().decode(BaseAPIResponse<EntryDataResponseDTO>.self, from: data)
        } catch {
            fatalError("Couldn't parse json file")
        }
        completion(.success(response))
    }
}
