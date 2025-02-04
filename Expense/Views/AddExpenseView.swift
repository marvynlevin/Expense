//
//  AddExpenseView.swift
//  Expense
//
//  Created by levin marvyn on 04/02/2025.
//

import SwiftUI

struct AddExpenseView:View {
    
    @Environment(\.presentationMode) var pm
    @EnvironmentObject var expenseVM: ExpenseViewModel
    
    @State private var expenseTitle: String = ""
    @State private var category: Category = .perso
    @State private var priceString: String = "0.00"
    
    var body: some View {
        VStack {
            TextField("Enter the destination expense", text: $expenseTitle)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(.systemGray4))
                .cornerRadius(10)
            
            TextField("0", text: $priceString)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(.systemGray4))
                .cornerRadius(10)
                .onChange(of: priceString, { newValue in
                    if let priceFloat = Float(newValue) {
                        price = priceFloat
                    }})
            
            Picker("Category", selection: $category) {
                ForEach(Category.allCases, id: \.self) {
                    category in Text(category.rawValue)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Spacer()
            
            Button {
                self.expenseVM.addExpense(expense: Expense(title: expenseTitle, price: price, category: category))
            } label: {
                Text("SAVE")
                    .foregroundStyle(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .background(Color.accentColor)
                    .cornerRadius(10)
            }
        }
        .padding(14)
        .navigationTitle("Add an expense")
    }
}
