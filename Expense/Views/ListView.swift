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
    //TODO: récupérer les catégories (a ne pas faire, faire une méthode du model)
    let categories: [Category] = Category.allCases
    
    var body: some View {
        
        NavigationView {
            VStack {
                List {
                    ForEach(expenseVM.expenses) { expense in
                        RowView(expense: expense)
                            .onTapGesture {
                                // trouver l'index de la category actuelle
                                if let currentIndex = categories.firstIndex(of: expense.category) {
                                    // calculer le prochain index (modulo si nécessaire)
                                    let nextIndex = (currentIndex + 1) % categories.count
                                    // mettre à jour l'expense avec la category suivante
                                    expenseVM.updateExpense(expense: expense, category: categories[nextIndex])
                                }
                            }
                    }
                    .onDelete(perform: expenseVM.deleteExpense)
                    .onMove(perform: expenseVM.moveExpense)
                }
                .listStyle(PlainListStyle())
            
                HStack {
                    Text("Total")
                       .font(.title2)
                       .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                    Spacer()
                
                    Text(String(format: "$%.2f €", expenseVM.totalPrice()))
                        .font(.title2)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                .padding()
                .background(Color(.systemGray6))
            }
        
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

