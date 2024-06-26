//
//  SpendType.swift
//  Spendific
//
//  Created by Pranav R on 26/06/24.
//

import SwiftUI

enum SpendType: String {
    case income, expense
}

enum Categories: String, CaseIterable {
    case income, fuel, food, media, other
}

// Category types

struct Category: Identifiable {
    let id: UUID = .init()
    var name: String
    var bgColor: Color
    var accentColor: Color
}

var availableCategories: [Category] = [
    
]
