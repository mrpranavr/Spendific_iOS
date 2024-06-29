//
//  CardView.swift
//  Spendific
//
//  Created by Pranav R on 27/06/24.
//

import SwiftUI

struct CardView: View {
    // Environment properties
    @Environment(\.colorScheme) private var colorScheme
    
    // View Properties
    var income: Double
    var expense: Double
    
    var body: some View {
        VStack(spacing: 25) {
            VStack(spacing: 10) {
                Text("Net Monthly Expense")
                    .font(.subTexts)
                    .tracking(1.5)
                .foregroundStyle(colorScheme == .dark ? .gray : appCaptionTint)
                
                HStack {
                    Text("\(currencyString(getNetExpense(income: income, expense: expense), allowedDigits: 0))")
                        .font(.boldHeader)
                        .foregroundStyle(colorScheme == .dark ? .white : appTint)
                        //.foregroundStyle(expense > income ? .primaryRed : .incomeAccent)
                    .multilineTextAlignment(.center)
                    
                    Image(systemName: expense > income ? "arrowshape.up.fill" : "arrowshape.down.fill")
                        .font(.title2)
                        .foregroundStyle(expense > income ? .incomeAccent : .primaryRed)
                }
            }
            
            HStack(spacing: 10) {
                statCards(title: "Income", amount: income, iconName: "arrowshape.up.fill")
                Spacer()
                statCards(title: "Expense", amount: expense, iconName: "arrowshape.down.fill")
//                    .padding(.leading, 40)
            }
            .frame(maxWidth: 280)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 25)
        .padding(.horizontal, 20)
        .background {
            RoundedRectangle(cornerRadius: 20)
                .fill(colorScheme == .dark ? .gray.opacity(0.2) : .white)
                .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 4)
        }
        .padding(.horizontal, 16)
        .padding(.top, 35)
    }
    
    @ViewBuilder
    func statCards(title: String, amount: Double, iconName: String) -> some View {
        HStack {
            Image(systemName: iconName)
                .font(.title3)
                .foregroundStyle(title == "Income" ? .incomeAccent : .primaryRed)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.subTexts)
                    .tracking(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.gray)
                
                Text("\(currencyString(amount, allowedDigits: 0))")
                    .font(.cardCatStyle)
                    .foregroundStyle(title == "Income" ? .incomeAccent : .primaryRed)
            }
        }
    }
}

#Preview {
    CardView(income: 20000, expense: 15000)
}
