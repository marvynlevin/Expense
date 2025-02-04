//
//  ContentView.swift
//  Expense
//
//  Created by levin marvyn on 28/01/2025.
//

import SwiftUI

struct ListView: View {
    
    // var data: [Expense]
    @EnvironmentObject var expenseVM:ExpenseViewModel
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(expenseVM.expenses) {
                    expense in RowView(expense: expense)
                        .onTapGesture {
                            self.expenseVM.updateExpense(expense: expense)
                        }
                }
                .onDelete(perform: expenseVM.deleteExpense)
                .onMove(perform: expenseVM.moveExpense)
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Expenses")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink("Add", destination: AddExpenseView())
                }
            }
        }
    }
}

#Preview {
    ListView()
        .environmentObject(ExpenseViewModel())
}

