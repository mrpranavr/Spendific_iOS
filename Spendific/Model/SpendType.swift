/*
SpentType.swift
 This file contains all the metadata related to the `Categories` and its types.
 All changes related to categories are housed here.
*/

import SwiftUI

/*
SpendType -> Enum to hold the primary transaction type.
*/

enum SpendType: String {
    case income, expense
}

// ================================================

/*
CategoryNames -> Use this enum to add more transaction type to the app.
 ** Refer the `Category` struct for more info on how to add new category metadata to app.
*/

enum CategoryNames: String, CaseIterable {
    case income, transport, food, media, other
}

// ================================================

/*
Category -> Main struct that hold the metadata for each category.
 - name: Name of the category.
 - bgColor: Background Color of the category.
 - accentColor: Accent color of the category.
 - iconName: Name of the SF Symbol used for the current category.
 
 After adding a new enum to the `CategoryNames`, create a new object under this in the `availableCategories` array.
 Mention all the above mentioned metadata for the object for it to reflect on the app.
*/

struct Category: Identifiable {
    let id: UUID = .init()
    var name: String
    var bgColor: Color
    var accentColor: Color
    var iconName: String
}

var availableCategories: [Category] = [
    .init(name: CategoryNames.income.rawValue, bgColor: .income, accentColor: .incomeAccent, iconName: "creditcard"),
    .init(name: CategoryNames.transport.rawValue, bgColor: .fuel, accentColor: .fuelAccent, iconName: "car"),
    .init(name: CategoryNames.food.rawValue, bgColor: .food, accentColor: .foodAccent, iconName: "fork.knife"),
    .init(name: CategoryNames.media.rawValue, bgColor: .media, accentColor: .mediaAccent, iconName: "ticket"),
    .init(name: CategoryNames.other.rawValue, bgColor: .others, accentColor: .othersAccent, iconName: "cart")
]

// ================================================

/*
Helper functions to faciliate access to the category metadata using the given category enum value.
 You can use these methods to access the bgColor, accentColor and iconName for each category throughout the app.
*/

func getCategoryBgColor(_ categoryName: CategoryNames) -> Color {
    return availableCategories.first(where: {$0.name == categoryName.rawValue})?.bgColor ?? appTint
}

func getCategoryAccentColor(_ categoryName: CategoryNames) -> Color {
    return availableCategories.first(where: {$0.name == categoryName.rawValue})?.accentColor ?? appTint
}

func getCategoryIconName(_ categoryName: CategoryNames) -> String {
    return availableCategories.first(where: {$0.name == categoryName.rawValue})?.iconName ?? ""
}
