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
            Text("\(expense.price) €")
            
            Text(expense.stateTransaction)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                .cornerRadius(20)
        }
    }
}

#Preview {
    RowView(expense: Expense.testData[0])
}
