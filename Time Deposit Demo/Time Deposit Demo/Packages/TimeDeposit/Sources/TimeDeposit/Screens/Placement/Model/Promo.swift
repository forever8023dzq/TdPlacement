//
//  File.swift
//  
//
//  Created by Apple on 2023/4/17.
//

import Foundation

public struct Promo {
    public var name: String
    public var code: String
    public var isError: Bool
    public var errorMsg: String
    
    public init(
        name: String,
        code: String,
        isError: Bool,
        errorMsg: String
    ) {
        self.name = name
        self.code = code
        self.isError = isError
        self.errorMsg = errorMsg
    }
}
