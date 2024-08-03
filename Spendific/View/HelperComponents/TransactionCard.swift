//
//  TransactionCard.swift
//  Spendific
//
//  Created by Pranav R on 29/06/24.
//

import SwiftUI

struct TransactionCard: View {
    
    var transaction: Transaction
    
    // Environment variables
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        HStack {
            Image(systemName: transaction.catIconName)
                .font(.title2)
                .foregroundStyle(colorScheme == .dark ? transaction.catBgColor : transaction.catAccentColor)
                .frame(width: 55, height: 55)
                .background(colorScheme == .dark ? transaction.catAccentColor : transaction.catBgColor, in: .rect(cornerRadius: 8))
                .padding(.trailing, 5)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(transaction.title)
                    .font(.custom("Poppins-Medium", size: 13))
                    .tracking(0.8)
                
                Text(format(date: transaction.dateAdded, format: "dd-MM-yyyy"))
                    .font(.custom("Poppins-Regular", size: 11))
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            Text(currencyString(transaction.amount, allowedDigits: 2))
                .font(.subHeader)
                .fontWeight(.semibold)
                .foregroundStyle(transaction.spendType == SpendType.income.rawValue ? .incomeAccent : .primaryRed)
                .padding(.leading, 5)
        }
        .padding(15)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .fill(colorScheme == .dark ? .gray.opacity(0.2) : .white)
                .shadow(color: .gray.opacity(0.1), radius: 4, x: 0, y: 4)
        }
    }
}

#Preview {
    TransactionCard(transaction: sampleTransactions[0])
}
