//
//  OverviewView.swift
//  Expense
//
//  Created by levin marvyn on 11/02/2025.
//

import SwiftUI

struct OverviewView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    //TODO: système de filtrage par date non réalisé (class non a jour et implémentation inconnu)
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
            
            
            
            
        }
        .navigationTitle("Overview")
        
    }
}


#Preview {
    OverviewView()
       //.environmentObject(ExpenseViewModel())
}
