/*
Transaction.swift
 This file contains all the metadata related to the `Trasaction` object.
*/

import SwiftUI
import SwiftData

/*
Transaction
 This is the primary class for the `Transaction` object.
 Model for the SwiftData is being referenced here.
*/
struct Transaction: Identifiable {
    let id: UUID = .init()
    var title: String
    var remarks: String
    var amount: Double
    var dateAdded: Date
    var spendType: String
    var categoryName: String
    
    init(title: String, remarks: String, amount: Double, dateAdded: Date, spendType: SpendType, categoryName: CategoryNames) {
        self.title = title
        self.remarks = remarks
        self.amount = amount
        self.dateAdded = dateAdded
        self.spendType = spendType.rawValue
        self.categoryName = categoryName.rawValue
    }
    
    var catBgColor: Color {
        return availableCategories.first(where: {$0.name == categoryName})?.bgColor ?? appTint
    }
    
    var catAccentColor: Color {
        return availableCategories.first(where: {$0.name == categoryName})?.accentColor ?? appAccent
    }
    
    var catIconName: String {
        return availableCategories.first(where: {$0.name == categoryName})?.iconName ?? ""
    }
    
    var rawCategory: CategoryNames? {
        return CategoryNames.allCases.first(where: {$0.rawValue == categoryName})
//        return availableCategories.first(where: {$0.name == categoryName}).
    }
    
    var rawSpendType: SpendType? {
        return SpendType.allCases.first(where: {$0.rawValue == spendType})
    }
}

// Sample transaction to be used for building/testing the app with transactions.
var sampleTransactions: [Transaction] = [
    .init(title: "Zangos Chicken", remarks: "Food with friends as Zangos", amount: 900, dateAdded: .init(), spendType: .expense, categoryName: .food),
    .init(title: "PlayStation Network", remarks: "Subscription for PlayStation", amount: 849, dateAdded: .init(), spendType: .expense, categoryName: .media),
    .init(title: "Salary June", remarks: "Monthly Salary", amount: 100000, dateAdded: .init(), spendType: .income, categoryName: .income)
]
