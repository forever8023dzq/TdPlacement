//
//  EntryDataDTO.swift
//  
//
//  Created by Apple on 2023/4/17.
//

import Foundation

public struct EntryDataRequestDTO: Codable {
    let fromCurrency: Currency
    let toCurrency: Currency
}

extension EntryDataRequestDTO {
    static func map(request: EntryDataRequest) -> EntryDataRequestDTO {
        return EntryDataRequestDTO(fromCurrency: request.fromCurrency, toCurrency: request.toCurrency)
    }
}

public struct EntryDataResponseDTO: Codable {
    let minAmount: Double
    let exchangeRate: Double
}
