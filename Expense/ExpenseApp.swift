//
//  ExpenseApp.swift
//  Expense
//
//  Created by levin marvyn on 28/01/2025.
//

import SwiftUI

@main
struct ExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            // on utilise le TabView
            ContentView()
                // et la class Expense
                .environmentObject(ExpenseViewModel())
        }
    }
}
