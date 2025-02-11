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
            
            Spacer()
            
            // 2 valeurs après la virgule
            Text(String(format: "%.2f €", expense.price))
            
            
            Text(expense.category.rawValue)
                .font(.footnote)
                .padding(3)
                // on récupère la couleur du enum Category
                .foregroundStyle(expense.category.color)
                .frame(width: 62)
                .overlay(
                Capsule()
                    .stroke(expense.category.color, lineWidth: 0.75)
            )
        }
        .font(.title2)
        .padding(.vertical, 10)
    }
}

#Preview {
    RowView(expense: Expense.testData[0])
}

