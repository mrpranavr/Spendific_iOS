//
//  Home.swift
//  Spendific
//
//  Created by Pranav R on 25/06/24.
//

import SwiftUI

struct Home: View {
    // App Storage Properties
    @AppStorage("userName") private var userName: String = "Icarus"
    
    // Environment Properties
    @Environment(\.colorScheme) private var colorScheme
    
    // View Properties
    @State private var showAddExpenseView: Bool = false
    @Binding var currentPage: Tab
    
    var body: some View {
        GeometryReader { size in
            // For Animation purposes
//            let size = $0.size
            
            NavigationStack {
                    ScrollView(.vertical, showsIndicators: false, content: {
                        LazyVStack(spacing: 35) {
                            // MARK: Month's expense Card View
                            CardView(income: 15000, expense: 10000)
                            
                            // MARK: Add Expense Categories
                            VStack {
                                Text("Add Transaction")
                                    .hSpacing(.leading)
                                    .font(.cardCatStyle)
                                    .tracking(0.7)
                                
                                AddNewHorizontalScrollView()
                            }
                            .padding(.horizontal, 16)
                            
                            // MARK: Recent Trasactions
                            VStack {
                                HStack {
                                    Text("Recent Transaction")
                                        .hSpacing(.leading)
                                        .font(.cardCatStyle)
                                        .tracking(0.7)
                                    
                                    Button(action: {
                                        currentPage = .search
                                    }, label: {
                                        Text("View All")
                                            .font(.subHeader)
                                            .foregroundStyle(.gray)
                                            .tracking(0.7)
                                    })
                                    
                                }
                                .padding(.bottom, 16)
                                
                                ForEach(sampleTransactions) { item in
                                    Button(action: {
                                        
                                    }, label: {
                                        TransactionCard(transaction: item)
                                    })
                                    .buttonStyle(.plain)
                                }
                            }
                            .padding(.horizontal, 16)
                            
                            VStack {}
                                .frame(height: 80)
                        }
                    })
                    .navigationTitle("Home")
                    .toolbar(content: {
                        ToolbarItem(content: {
                            Button(action: {
                                showAddExpenseView.toggle()
                            }, label: {
                                Image(systemName: "plus")
                                    .font(.caption)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.white)
                                    .frame(width: 30, height: 30)
                                    .background(appAccent.gradient, in: .circle)
                            })
                        })
                })
            }
            .sheet(isPresented: $showAddExpenseView, content: {
                AddTransactionView()
            })
        }
    }
    
    
//    @ViewBuilder
//    func HeaderView(_ size: CGSize) -> some View {
//        HStack(spacing: 10) {
//            VStack(alignment: .leading, spacing: 5) {
//                Text("Good Morning")
//                    .font(.caption)
//                    .foregroundStyle(.gray)
//                
//                if !userName.isEmpty {
//                    Text(userName)
//                        .font(.callout.bold())
//                        .foregroundStyle(appTint)
//                }
//            }
//            
//            Spacer()
//            
//            Button(action: {
//                
//            }, label: {
//                Image(systemName: "plus")
//                    .font(.title3)
//                    .fontWeight(.semibold)
//                    .foregroundStyle(.white)
//                    .frame(width: 35, height: 35)
//                    .background(appAccent.gradient, in: .circle)
//                    .contentShape(.circle)
//            })
//        }
//        .background {
//            VStack(spacing: 0) {
//                Rectangle()
//                    .fill(.ultraThinMaterial)
//                
//                Divider()
//            }
//        }
//    }
}

#Preview {
    Home(currentPage: .constant(.home))
}
