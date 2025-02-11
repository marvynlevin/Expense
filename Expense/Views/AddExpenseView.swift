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
    @State private var priceString: String = ""
    
    // conversion d'une chaine en un float
    private let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    } ()
    
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
            
            Picker("Category", selection: $category) {
                ForEach(Category.allCases, id: \.self) {
                    category in Text(category.rawValue)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Spacer()
            
            Button {
                if let priceFloat = numberFormatter.number(from: priceString)?.floatValue {
                    let expense = Expense(title: expenseTitle, price: priceFloat, category: category)
                    expenseVM.addExpense(expense: expense)
                    
                    pm.wrappedValue.dismiss() // fermer la vue après clic
                } else {
                    print("invalid price")
                }
                
                
            } label: {
                Text("SAVE")
                    .foregroundStyle(.white)
                    .font(.headline)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .frame(width: 300, height: 55)
                    .background(Color.accentColor)
                    .cornerRadius(10)
            }
        }
        .padding(14)
        .navigationTitle("Add an expense")
    }
}
