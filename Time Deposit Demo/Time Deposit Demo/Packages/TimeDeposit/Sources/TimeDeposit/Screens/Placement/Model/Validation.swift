//
//  Validation.swift
//  
//
//  Created by Apple on 2023/4/17.
//

import Foundation

public struct Validation {
    public var amountError: Bool
    public var isTenorClikable: Bool
    public var isPromoClikable: Bool
    public var amountMsg: String
    public var fromAccountError: Bool
    public var continueBtn: Bool
    
    public init(
        amountError: Bool,
        isTenorClikable: Bool,
        isPromoClikable: Bool,
        amountMsg: String,
        fromAccountError: Bool,
        continueBtn: Bool
    ) {
        self.amountError = amountError
        self.isTenorClikable = isTenorClikable
        self.isPromoClikable = isPromoClikable
        self.amountMsg = amountMsg
        self.fromAccountError = fromAccountError
        self.continueBtn = continueBtn
    }
}
