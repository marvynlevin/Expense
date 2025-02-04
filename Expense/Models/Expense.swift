//
//  Expense.swift
//  Expense
//
//  Created by levin marvyn on 28/01/2025.
//

import Foundation
import SwiftUI

enum Category: String, CaseIterable {
    case all = "All"
    case perso = "Perso"
    case vacation = "Vacation"
    case pro = "Pro"
    
    var color: Color {
        switch self {
        case .perso:
            return Color.pink
        case .all:
            return Color.black
        case .vacation:
            return Color.orange
        case .pro:
            return Color.green
        }
    }
}

struct Expense: Identifiable {
    
    var id = UUID()
    var title: String
    var price: Float
    var category: Category
    
    static var testData = [
        Expense(title: "Apple", price: 120.00, category: .perso),
        Expense(title: "Airbnb", price: 1200.00, category: .perso),
        Expense(title: "McDonald", price: 300.00, category: .vacation),
        Expense(title: "Bakery", price: 10.00, category: .vacation),
        Expense(title: "Mechanic", price: 1000.00, category: .pro),
    ]
    
}

