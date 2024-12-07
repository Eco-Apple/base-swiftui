//
//  Decimal.swift
//  base-swiftui
//
//  Created by Jerico Villaraza on 12/7/24.
//

import Foundation

extension Decimal {
    var toString: String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = ""
        
        let result = formatter.string(from: self as NSNumber)

        return result?.toDecimal
    }
    
    
    var toCurrency: String {
        let currencySymbol = Locale.current.currencySymbol ?? ""
        let isNegative = self.sign == .minus
        
        if isNegative {
            return "- " + currencySymbol + (self * -1).toString!
        }
        
        return currencySymbol + self.toString!
    }
}
