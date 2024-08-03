//
//  AddTransactionView.swift
//  Spendific
//
//  Created by Pranav R on 30/06/24.
//

import SwiftUI

struct AddTransactionView: View {
    @AppStorage("enableDarkMode") private var enableDarkMode: Bool = false
    
    // Environment Variables
    @Environment(\.dismiss) private var dismiss
    @Environment(\.colorScheme) private var colorScheme
    
    // View Properties
    @State private var title: String = ""
    @State private var remarks: String = ""
    @State private var amount: Double = .zero
    @State private var dateAdded: Date = .init()
    @State var category: CategoryNames = .other
    @State var spendType: SpendType = .expense
    
    // Edit Transaction ?
    @Binding var editTransaction: Transaction?
    
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
                            amount: Double(amountString) ?? .zero,
                            dateAdded: dateAdded,
                            spendType: spendType,
                            categoryName: category))
                    }
                    
                    VStack(spacing: 10) {
                        // Title Input Field
                        FloatingLabelTextField(title: "Title", text: $title, isTextFieldFocused: _isTitleFieldFocused)
                        
                        
                        // Remarks Input Field
                        FloatingLabelTextField(title: "Remarks", text: $remarks, isTextFieldFocused: _isRemarkFieldFocused)
                        
                        // Spend type segemented picker
                        CustomSegementedPicklist(SpendType.allCases, selectedItem: $spendType, toChangeValue: $category, content: {type in
                            Text(type.rawValue.capitalized)
                                .font(.subHeader)
                                .foregroundStyle(.primary)
                                .frame(maxWidth: .infinity)
                        })
                        
                        HStack {
                            // Amount Input Field
                            FloatingLabelTextField(title: "Amount", text: $amountString, isTextFieldFocused: _isAmountFieldFocused, placeholder: "0.0", type: .Number)
                            
                            // Category Picker Field
                            CustomPicklist(picklistValues: CategoryNames.picklistValues(for: spendType))
                            
                        }
                        
                        DatePicker("", selection: $dateAdded, displayedComponents: [.date])
                            .datePickerStyle(.graphical)
                            .padding()
                            .background(!enableDarkMode ? .lightGrayCustom : .gray.opacity(0.2), in: .rect(cornerRadius: 10))
                    }
                }
                .padding(.top, 30)
            })
            .padding(.horizontal, 16)
            .navigationTitle("\(editTransaction == nil ? "Add" : "Edit") Transaction")
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
            .onAppear(perform: {
                if let editTransaction {
                    // Loading the selected transaction data to modal
                    title = editTransaction.title
                    remarks = editTransaction.remarks
                    dateAdded = editTransaction.dateAdded
                    amount = editTransaction.amount
                    amountString = String(editTransaction.amount)
                    if let categoryN = editTransaction.rawCategory {
                        print(categoryN)
                        self.category = categoryN
                    }
                    if let spendT = editTransaction.rawSpendType {
                        print(spendT)
                        self.spendType = spendT
                    }
                }
            })
        }
        .environment(\.colorScheme, enableDarkMode ? .dark : .light)
    }
    
    @ViewBuilder
    func CustomPicklist(picklistValues: [CategoryNames]) -> some View {
        ZStack(alignment: .leading) {
            Text("Category")
                .font(.subHeader)
                .foregroundStyle(.secondary)
                .tracking(0.7)
                .hSpacing(.leading)
                .scaleEffect(0.75, anchor: .leading)
                .offset(y: -25)
            
            Menu {
                Picker("", selection: $category, content: {
                    ForEach(picklistValues,
                            id: \.rawValue) { category in
                        Text(category.rawValue.capitalized)
                            .tag(category)
                            .font(.subHeader)
                    }
                })
            } label: {
                Text(category.rawValue.capitalized)
                    .font(.subHeader)
                    .tracking(0.7)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            }
            .id(category)
        }
        .padding(.top, 20)
        .padding(.horizontal, 15)
        .frame(maxWidth: 140)
        .background(!enableDarkMode ? .lightGrayCustom : .gray.opacity(0.2), in: .rect(cornerRadius: 10))

    }
}

#Preview {
//    AddTransactionView(category: CategoryNames.income, editTransaction: <#T##Binding<Transaction?>#>)
    ContentView()
}
