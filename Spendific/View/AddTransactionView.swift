//
//  AddTransactionView.swift
//  Spendific
//
//  Created by Pranav R on 30/06/24.
//

import SwiftUI

struct AddTransactionView: View {
    // Environment Variables
    @Environment(\.dismiss) private var dismiss
    @Environment(\.colorScheme) private var colorScheme
    
    // View Properties
    @State private var title: String = ""
    @State private var remarks: String = ""
    @State private var amount: Double = .zero
    @State private var dateAdded: Date = .init()
    @State private var spendType: SpendType = .expense
    @State private var category: CategoryNames = .transport
    
    @State private var amountString: String = ""
    
    // Focus States
    @FocusState private var isTitleFieldFocused: Bool
    @FocusState private var isRemarkFieldFocused: Bool
    @FocusState private var isAmountFieldFocused: Bool
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(spacing: 35) {
                    VStack(spacing: 10) {
                        Text("Preview")
                            .font(.subHeader)
                            .hSpacing(.leading)
                        
                        TransactionCard(transaction: .init(
                            title: title.isEmpty ? "Title" : title,
                            remarks: remarks.isEmpty ? "Remarks" : remarks,
                            amount: amount,
                            dateAdded: dateAdded,
                            spendType: spendType,
                            categoryName: category))
                    }
                    
                    VStack(spacing: 10) {
                        FloatingLabelTextField(title: "Title", text: $title, isTextFieldFocused: _isTitleFieldFocused, placeholder: "Title")
                        FloatingLabelTextField(title: "Remarks", text: $remarks, isTextFieldFocused: _isRemarkFieldFocused, placeholder: "Remarks")
                        
                        CustomSegementedPicklist(SpendType.allCases, selectedItem: $spendType, content: {type in
                            Text(type.rawValue.capitalized)
                                .font(.subHeader)
                                .foregroundStyle(.primary)
                                .frame(maxWidth: .infinity)
                        })
                        
                        // TODO: Add Amount field here. Need to update the Custom text Field to check number type.
                        
                        HStack {
                            FloatingLabelTextField(title: "Amount", text: $amountString, isTextFieldFocused: _isAmountFieldFocused, placeholder: "Amount")
                    
                        }
                        
                        DatePicker("", selection: $dateAdded, displayedComponents: [.date])
                            .datePickerStyle(.graphical)
                            .padding()
                            .background(colorScheme == .light ? .lightGray : .gray.opacity(0.2), in: .rect(cornerRadius: 10))
                    }
                }
                .padding(.top, 30)
            })
            .padding(.horizontal, 16)
            .navigationTitle("Add Transaction")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .cancellationAction, content: {
                    Button(action: {
                        // TODO: Cancel Action and close Modal
                        dismiss()
                    }, label: {
                        Text("Cancel")
                            .font(.settingsHeader)
                    })
                })
                
                ToolbarItem(placement: .confirmationAction, content: {
                    Button(action: {
                        // TODO: Save Action and close Modal
                    }, label: {
                        Text("Save")
                            .font(.settingsHeader)
                    })
                })
            })
        }
    }
    
//    @ViewBuilder
//    func customTextField(_ title: String, value: Binding<String>, placeholder: String) -> some View {
////        VStack(alignment: .leading, spacing: 10) {
////            Text(title)
////                .font(.subHeader)
////                .hSpacing(.leading)
////            
////            TextField(placeholder, text: value)
////                .padding(.horizontal, 15)
////                .padding(.vertical, 10)
////                .background(.gray.opacity(0.2), in: .rect(cornerRadius: 10))
////                
////        }
//        ZStack(alignment: .topLeading) {
//            Text(title)
//                .font(.subHeader)
//                .hSpacing(.leading)
//                .scaleEffect(isTextFieldFocused ? 0.8 : 1, anchor: .leading)
//                .offset(y: isTextFieldFocused ? -20 : 0)
//                .animation(.easeInOut(duration: 0.2), value: isTextFieldFocused)
//            
//            TextField("", text: value)
//                .focused($isTextFieldFocused)
//                .onChange(of: isTextFieldFocused) { focused in
//                        if !focused {
//                            // If the text field loses focus and is empty, reset the label
//                            withAnimation(.easeInOut(duration: 0.2)) {
//                                isTextFieldFocused = false
//                            }
//                        }
//                    }
//        }
//        .padding(.vertical, 10)
//        .padding(.horizontal, 15)
//        .background(.gray.opacity(0.2), in: .rect(cornerRadius: 10))
//        .onTapGesture {
//            isTextFieldFocused = true
//        }
//    }
}

#Preview {
    AddTransactionView()
}
