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
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack {
                ForEach(CategoryNames.allCases, id: \.rawValue) { category in
                     addNewItem(name: category.rawValue, iconName: getCategoryIconName(category), category: category)
                }
            }
        })
    }
    
    @ViewBuilder
    func addNewItem(name: String, iconName: String, category: CategoryNames) -> some View {
        Button(action: {
            // TODO: Implement feature to toggle the add new expense modal/sheet from the parent view via bindings.
            
        }, label: {
            VStack {
                Image(systemName: iconName)
                    .font(.title)
                    .foregroundStyle(colorScheme == .dark ? getCategoryBgColor(category) : getCategoryAccentColor(category))
                    .frame(width: 77, height: 77)
                    .background(colorScheme == .dark ? getCategoryAccentColor(category) : getCategoryBgColor(category), in: .rect(cornerRadius: 16))
                
                Text(name)
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
