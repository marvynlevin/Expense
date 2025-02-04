//
//  Expense.swift
//  Expense
//
//  Created by levin marvyn on 28/01/2025.
//

import Foundation

struct Expense: Identifiable {
    
    var id = UUID()
    var title: String
    var price: Float
    var stateTransaction: String
    
    static var testData = [
        Expense(title: "Apple", price: 120.00, stateTransaction: "Perso"),
        Expense(title: "Airbnb", price: 1200.00, stateTransaction: "Perso"),
        Expense(title: "McDonald", price: 300.00, stateTransaction: "Vacation"),
        Expense(title: "Bakery", price: 10.00, stateTransaction: "Perso"),
        Expense(title: "Mechanic", price: 1000.00, stateTransaction: "Pro"),
    ]
    
}

