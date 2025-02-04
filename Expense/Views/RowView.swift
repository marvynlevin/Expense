//
//  RowView.swift
//  Expense
//
//  Created by levin marvyn on 28/01/2025.
//

import SwiftUI

struct RowView: View {
    
    let expense: Expense
    
    var body: some View {
        HStack {
            Text(expense.title)
            // 2 valeurs après la virgule
            Text(String(format: "%.2f €", expense.price))
            
            Spacer()
            
            Text(expense.category.rawValue)
                .font(.footnote)
                .padding(3)
                .foregroundStyle(Color(.systemGray2))
                .frame(width: 62)
                .overlay(
                Capsule()
                    .stroke(Color(.systemGray2), lineWidth: 0.75)
                )
        }
        .font(.title2)
        .padding(.vertical, 10)
    }
}

#Preview {
    RowView(expense: Expense.testData[0])
}

