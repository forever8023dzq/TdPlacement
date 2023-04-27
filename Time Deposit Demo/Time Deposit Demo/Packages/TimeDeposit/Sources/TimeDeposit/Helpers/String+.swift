//
//  String+.swift
//  
//
//  Created by Damon Ng on 3/10/22.
//

import Foundation

public enum DateFormatStyle: String {
    case yyyy_MM_dd = "yyyy-MM-dd"
    case dd_MMM_yyyy = "dd MMM yyyy"
}

extension String {
    func date(inputFormat: DateFormatStyle, outputFormat: DateFormatStyle) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = inputFormat.rawValue
        guard let date = dateFormatter.date(from: self) else {
            return ""
        }
        dateFormatter.dateFormat = outputFormat.rawValue
        return dateFormatter.string(from: date)
    }
}
