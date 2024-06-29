//
//  HelperFunctions.swift
//  Spendific
//
//  Created by Pranav R on 27/06/24.
//

import SwiftUI

// Function to calculate the net expense give the income and expense amount.
func getNetExpense(income: Double, expense: Double) -> Double {
    return abs(income - expense)
}

// Function to format the given currency amount as a double to a value with given decimal places
func currencyString(_ value: Double, allowedDigits: Int = 2) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.maximumFractionDigits = allowedDigits
    
    return formatter.string(from: .init(value: value)) ?? ""
}
