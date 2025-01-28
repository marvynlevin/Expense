//
//  ContentView.swift
//  Expense
//
//  Created by levin marvyn on 28/01/2025.
//

import SwiftUI

struct ListView: View {
    
    var data: [Expense]
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(data) {
                    expense in RowView(expense: expense)
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Expenses")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink("Add", destination: AddExpenseView)
                }
            }
        }
    }
}

#Preview {
    ListView(data: Expense.testData)
}
