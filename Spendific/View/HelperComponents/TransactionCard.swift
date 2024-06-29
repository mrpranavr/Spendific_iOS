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
                .font(.title)
                .foregroundStyle(colorScheme == .dark ? transaction.catBgColor : transaction.catAccentColor)
                .frame(width: 77, height: 77)
                .background(colorScheme == .dark ? transaction.catAccentColor : transaction.catBgColor, in: .rect(cornerRadius: 16))
        }
    }
}

#Preview {
    TransactionCard(transaction: sampleTransactions[0])
}
