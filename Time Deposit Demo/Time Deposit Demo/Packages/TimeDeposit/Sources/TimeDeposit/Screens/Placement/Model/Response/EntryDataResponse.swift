//
//  EntryDataResponse.swift
//  
//
//  Created by Apple on 2023/4/17.
//

import Foundation
public struct EntryDataResponse {
    let minAmount: Double
    let exchangeRate: Double
}

extension EntryDataResponse {
    static func map(response: EntryDataResponseDTO) -> EntryDataResponse {
        return EntryDataResponse(minAmount: response.minAmount, exchangeRate: response.exchangeRate)
    }
}
