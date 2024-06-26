//
//  Transaction.swift
//  Spendific
//
//  Created by Pranav R on 26/06/24.
//

import SwiftUI
import SwiftData

@Model
class Transaction {
    var title: String
    var remarks: String
    var amount: Double
    var dateAdded: Date
    var spendType: SpendType
    var category: Category
    var tintColor: Color
    
    init(title: String, remarks: String, amount: Double, dateAdded: Date, spendType: SpendType, category: Category, tintColor: Color) {
        self.title = title
        self.remarks = remarks
        self.amount = amount
        self.dateAdded = dateAdded
        self.spendType = spendType
        self.category = category
        self.tintColor = tintColor
    }
}

