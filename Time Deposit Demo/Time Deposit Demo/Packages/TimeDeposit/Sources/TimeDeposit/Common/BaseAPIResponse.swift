//
//  BaseAPIResponse.swift
//  
//
//  Created by Damon Ng on 3/10/22.
//

import Foundation

public enum ResponseStatus: String, Codable {
    case success = "SUCCESS"
}

public struct BaseAPIResponse<T: Codable>: Codable {
    let status: ResponseStatus
    let data: T
}
