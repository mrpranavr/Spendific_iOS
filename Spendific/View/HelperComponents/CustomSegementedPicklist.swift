//
//  CustomSegementedPicklist.swift
//  Spendific
//
//  Created by Pranav R on 30/06/24.
//

import SwiftUI

public struct CustomSegementedPicklist<T: Equatable, Content: View>: View {
    // Environment Properties
    @Environment(\.colorScheme) private var colorScheme
    
    // Other Properties
    @Namespace private var selectionAnimation
    
    // View Properties
    @Binding var selectedItem: T
    private let items: [T]
    private let content: (T) -> Content
    @Binding var toChangeValue: CategoryNames
    
    init(_ items: [T],
                selectedItem: Binding<T>,
                toChangeValue: Binding<CategoryNames>,
                @ViewBuilder content: @escaping (T) -> Content) {
        self._selectedItem = selectedItem
        self.items = items
        self._toChangeValue = toChangeValue
        self.content = content
    }
    
    @ViewBuilder
    func overlay(for item: T) -> some View {
        if item == selectedItem {
            RoundedRectangle(cornerRadius: 7)
                .foregroundStyle(colorScheme == .dark ? Color.gray.opacity(0.4) : .white)
                .shadow(color: .gray.opacity(0.2), radius: 2 ,y: 1)
                .matchedGeometryEffect(id: "selectedSegmentHighlight", in: self.selectionAnimation)
        }
    }
    
    public var body: some View {
        HStack {
            ForEach(self.items.indices, id: \.self) {index in
                
                self.content(self.items[index])
                    .foregroundStyle(self.selectedItem == self.items[index] ? (colorScheme == .light ? .black : .white) : .gray)
                    .padding(.vertical, 8)
                    .contentShape(Rectangle())
                    .background(content: {
                        self.overlay(for: self.items[index])
                    })
                    .onTapGesture {
                        withAnimation(.linear(duration: 0.2)) {
                            self.selectedItem = self.items[index]
                            self.toChangeValue = self.selectedItem as! SpendType == SpendType.income ? CategoryNames.income : CategoryNames.other
                        }
                    }
            }
        }
        .padding(.horizontal, 5)
        .frame(height: 45)
        .background(colorScheme == .light ? .lightGrayCustom : .gray.opacity(0.2), in: .rect(cornerRadius: 10))
    }
}

#Preview {
//    CustomSegementedPicklist()
    ContentView()
}
