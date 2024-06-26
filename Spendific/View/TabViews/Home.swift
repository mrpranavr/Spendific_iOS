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
    
    var body: some View {
        GeometryReader {
            // For Animation purposes
            let size = $0.size
            
            NavigationStack {
                    ScrollView(.vertical, content: {
                        LazyVStack(spacing: 10) {
                            VStack(spacing: 10) {
                                Text("Expenses this month")
                                    .font(.subTexts)
                                    .tracking(1.5)
                                    .foregroundStyle(colorScheme == .dark ? .gray : appCaptionTint)
                                
                                Text("\(currencySymbol) 25000")
                                    .font(.boldHeader)
                                    .foregroundStyle(colorScheme == .dark ? .white : appTint)
                                    
                            }
                            .padding(.top, 50)
                        }
                    })
                    .navigationTitle("Home")
                    .toolbar(content: {
                        ToolbarItem(content: {
                            Button(action: {}, label: {
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
    Home()
}
