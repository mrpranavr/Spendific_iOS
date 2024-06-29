//
//  IntroScreen.swift
//  Spendific
//
//  Created by Pranav R on 25/06/24.
//

import SwiftUI

struct IntroScreen: View {
    // Visibility Status
    @AppStorage("isFirstTime") private var isFirstTime: Bool = true
    
    // Environment variables
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        VStack {
            
            VStack(spacing: 15) {
                VStack(spacing: 0) {
                    Text("Welcome to")
                        .font(.custom("Poppins-Medium", size: 20))
                        .fontWeight(.semibold)
                        .tracking(0.7)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(colorScheme == .dark ? .white : appTint)
                    
                    
                    HStack(spacing: 0) {
                        Text("Spend")
                            .font(.custom("Poppins-Bold", size: 55))
                            .tracking(0.7)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(appAccent.gradient)
                        
                        Text("ific")
                            .font(.custom("Poppins-Bold", size: 55))
                            .tracking(0.7)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(colorScheme == .dark ? .white : appTint)
                    }
                }
                
                Text("Take control of your spending and unlock financial insights effortlessly with Spendific.")
                    .font(.subHeader)
                    .tracking(0.7)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 320)
            }
            .padding(.top, 65)
            .padding(.bottom, 35)
            
            VStack(alignment: .leading, spacing: 25) {
                PointView(symbol: "creditcard.fill", title: "Transaction Management", subTitle: "Enhance your financial clarity with Spendific by giving your custom source of withdrawal")
                PointView(symbol: "list.bullet.clipboard.fill", title: "Expense Explorer", subTitle: "Log spending and sources, track monthly and weekly expenses hassle-free.")
                PointView(symbol: "chart.bar.xaxis", title: "Expense Visualizer", subTitle: "View your expenses in an intuitive graphs for quick analysis.")
            }
            
            Spacer()
            
            Button(action: {
                isFirstTime = false
            }, label: {
                Text("Start Logging")
                    .font(.cardCatStyle)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .tracking(0.7)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(appAccent.gradient, in: .rect(cornerRadius: 12))
                    .contentShape(.rect)
                
            })
        }
        .padding(15)
    }
    
    @ViewBuilder
    func PointView(symbol: String, title: String, subTitle: String) -> some View {
        HStack(spacing: 15) {
            Image(systemName: symbol)
                .font(.largeTitle)
                .foregroundStyle(appAccent.gradient)
                .frame(width: 45)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .font(.cardCatStyle)
                    .fontWeight(.semibold)
                    .foregroundStyle(colorScheme == .dark ? .white : appTint)
                
                Text(subTitle)
                    .font(.subHeader)
                    .foregroundStyle(.gray)
                    .tracking(0.7)
            }
        }
    }
}

#Preview {
    IntroScreen()
}
