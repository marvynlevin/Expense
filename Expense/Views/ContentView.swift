//
//  ContentView.swift
//  Expense
//
//  Created by levin marvyn on 11/02/2025.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var expenseVM: ExpenseViewModel
    
    var body: some View {
        TabView {
            // onglet des expenses
            ListView()
                .tabItem {
                    Label("Expenses", systemImage: "list.dash")
                }
            
            // onglet de l'overview
            OverviewView()
                .tabItem {
                    Label("Overview", systemImage: "chart.pie")
                }
        }
    }
}



#Preview {
    ContentView()
        .environmentObject(ExpenseViewModel())
}
