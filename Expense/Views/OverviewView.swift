//
//  OverviewView.swift
//  Expense
//
//  Created by levin marvyn on 11/02/2025.
//

import SwiftUI

struct OverviewView: View {
    
    @EnvironmentObject var expenseVM: ExpenseViewModel
    
    var body: some View {
        VStack {
            
            Spacer()
            
            VStack {
                HStack {
                    Text("Period start date")
                    Spacer()
                    Text("Sep 24, 2021")
                        .foregroundColor(Color(.systemBlue))
                        .padding(10)
                        .background(Color(.systemGray2).opacity(0.2))
                        .cornerRadius(8)
                }
                
                HStack {
                    Text("Period end date")
                    Spacer()
                    Text("Sep 27, 2021")
                        .foregroundColor(Color(.systemBlue))
                        .padding(10)
                        .background(Color(.systemGray2).opacity(0.2))
                        .cornerRadius(8)
                }
            }
            .padding(20)
            
            Spacer()
                    
            // affichage des totaux par catégorie dans un VStack
            VStack(spacing: 20) {
                // itérer sur le total par catégorie
                ForEach(expenseVM.totalByCategory.sorted { $0.key.rawValue < $1.key.rawValue }, id: \.key) { category, total in
                    HStack {
                        Text(category.rawValue)  // affiche le nom de la catégorie
                            .font(.headline)
                            .padding(3)
                            // on récupère la couleur du enum Category
                            .foregroundStyle(category.color)
                            .frame(width: 100)
                            .overlay(
                                Capsule()
                                    .stroke(category.color, lineWidth: 0.75)
                            )
                        
                            Spacer()
                        
                        // Affiche le total
                        Text(String(format: "$%.2f €", total))
                            .foregroundColor(category.color)
                            .font(.headline)
                    }
                    .padding(5)
                    .cornerRadius(8)
                }
            }
            .padding()
            
            Spacer()
        }
    }
}

