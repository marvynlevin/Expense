//
//  ExpenseViewModel.swift
//  Expense
//
//  Created by levin marvyn on 04/02/2025.
//

import Foundation

class ExpenseViewModel: ObservableObject {
    @Published var expenses: [Expense] = []
    
    var totalByCategory: [Category: Float] {
         var categoryTotals: [Category: Float] = [:]
         for expense in expenses {
             categoryTotals[expense.category, default: 0] += expense.price
         }
         
         // TODO: Affichage des totaux calculés
         print("Total by Category: \(categoryTotals)")
         
         return categoryTotals
     }
    
    init() {
        getExpenses()
    }
    
    func getExpenses() {
        self.expenses.append(contentsOf: Expense.testData)
    }
    
    func addExpense(expense: Expense) {
        self.expenses.append(expense)
    }
    
    func deleteExpense(indexSet: IndexSet) {
        self.expenses.remove(atOffsets: indexSet)
    }
    
    func moveExpense(from: IndexSet, to: Int) {
        self.expenses.move(fromOffsets: from, toOffset: to)
    }
    
    func updateExpense(expense: Expense, category: Category) {
        if let index = expenses.firstIndex(where: { $0.id == expense.id}) {
            expenses[index].category = category
        }
    }
    
    func totalPrice() -> Float {
        return expenses.reduce(0) { $0 + $1.price}
    }
}

