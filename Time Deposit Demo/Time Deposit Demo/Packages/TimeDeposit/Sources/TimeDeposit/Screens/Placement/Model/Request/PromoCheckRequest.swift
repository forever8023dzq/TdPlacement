//
//  PromoCheckRequest.swift
//  
//
//  Created by Apple on 2023/4/20.
//

import Foundation

public struct PromoCheckRequest {
    let promoCode: String
    let amount: String
    let currencyCode: Currency
}
