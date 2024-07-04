//
//  AddNewHorizontalScrollView.swift
//  Spendific
//
//  Created by Pranav R on 28/06/24.
//

import SwiftUI

struct AddNewHorizontalScrollView: View {
    
    // Environment variables
    @Environment(\.colorScheme) private var colorScheme
    
    // View Properties
    @State var showAddTransactionModal: Bool = false
    @State var currentCategorySelected: CategoryNames?
    
    var body: some View {
        NavigationStack {
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack {
                    ForEach(CategoryNames.allCases, id: \.rawValue) { category in
                         addNewItem(name: category.rawValue, iconName: getCategoryIconName(category), category: category)
                    }
                }
            })
        }
        .onChange(of: currentCategorySelected) { _ in
            if currentCategorySelected != nil {
                showAddTransactionModal.toggle()
            }
        }
        .sheet(isPresented: $showAddTransactionModal, onDismiss: {
            currentCategorySelected = nil
        }, content: {
            if let category = currentCategorySelected {
                AddTransactionView(category: category, spendType: category == .income ? .income : .expense)
            }
        })
    }
    
    @ViewBuilder
    func addNewItem(name: String, iconName: String, category: CategoryNames) -> some View {
        Button(action: {
            currentCategorySelected = category
        }, label: {
            VStack {
                Image(systemName: iconName)
                    .font(.title)
                    .foregroundStyle(colorScheme == .dark ? getCategoryBgColor(category) : getCategoryAccentColor(category))
                    .frame(width: 77, height: 77)
                    .background(colorScheme == .dark ? getCategoryAccentColor(category) : getCategoryBgColor(category), in: .rect(cornerRadius: 16))
                
                Text(name.capitalized)
                    .font(.subTexts)
                    .foregroundStyle(colorScheme == .dark ? .white : appTint)
                    .tracking(0.8)
            }
        })
    }

}

#Preview {
    AddNewHorizontalScrollView()
}
