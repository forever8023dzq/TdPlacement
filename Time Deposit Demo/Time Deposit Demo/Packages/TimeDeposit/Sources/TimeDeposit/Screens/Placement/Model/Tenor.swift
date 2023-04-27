//
//  File.swift
//  
//
//  Created by Apple on 2023/4/17.
//

import Foundation

public struct Tenor {
    public let term: String
    public let termCd: String
    public let interestRate: String
    public let valueDate: String
    
    public init(
        term: String,
        termCd: String,
        interestRate: String,
        valueDate: String
    ) {
        self.term = term
        self.termCd = termCd
        self.interestRate = interestRate
        self.valueDate = valueDate
    }
    
    
    public func getTermDesc() -> String {
        var desc = ""
        switch self.termCd {
        case TermCdType.DAY.rawValue:
            desc = "days"
        case TermCdType.MONTH.rawValue:
            desc = "months"
        case TermCdType.YEAR.rawValue:
            desc = "years"
        default:
            return ""
        }
        //return term == "1" ? desc.substring(to: desc.count-1) : desc
        return self.term + " " + desc
    }
    
    public func getInterestRateDescForList() -> String {
        return "Interest rate: " + self.interestRate + "% a year"
    }
    
    public func getInterestRateDescForEntry() -> String {
        return getTermDesc() + " at " + self.interestRate + "% a year"
    }
   
}
