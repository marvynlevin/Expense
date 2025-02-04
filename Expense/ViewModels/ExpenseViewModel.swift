//
//  ExpenseViewModel.swift
//  Expense
//
//  Created by levin marvyn on 04/02/2025.
//

import Foundation

class ExpenseViewModel: ObservableObject {
    
    @Published var expenses: [Expense] = []
    
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
    
    func updateExpense(expense: Expense) {
        // TODO
    }
}
