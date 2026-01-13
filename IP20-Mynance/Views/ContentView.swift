//
//  ContentView.swift
//  IP20-Mynance
//
//  Created by Mahesh, Harshitha on 4/28/25.
//

import SwiftUI

enum category: String, CaseIterable, Identifiable {
    case income = "Income"
    case groc = "Groceries"
    case util = "Utilities"
    
    var id: String { self.rawValue }
}



struct ContentView: View {
    @State private var showingSheet = false
    
    
    
    @StateObject var account = Account()
    
    
    
    var body: some View {
        NavigationStack {
            Text("Mynance")
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                .toolbar {
                    Button {
                        showingSheet.toggle()
                    }
                label: {
                    Image(systemName: "plus")
                        .foregroundColor(.blue)
                }
                .frame(maxWidth: .infinity, alignment:.bottomTrailing)
                .sheet(isPresented: $showingSheet) {
                    SheetView().environmentObject(account)
                }
                }
                .padding()
            Spacer()
        }
        
        VStack {
            Text("Balance")
                .foregroundColor(.gray)
            Text("$\(account.balance, specifier: "%.2f")")
                .font(.largeTitle)
                .fontWeight(.bold)
            
        }
        List {
            ForEach(account.transactions) { trsction in
                HStack {
                    VStack {
                        Text(trsction.categ)
                            .font(.headline)
                        Text(trsction.descrp)
                            .foregroundColor(.gray)
                    }
                    VStack {
                        HStack {
                            if (trsction.categ == "Income") {
                                Image(systemName: "cart.fill")
                                    .foregroundColor(.blue)
                                Text("\(trsction.amount, specifier: "%.2f")")
                                    .font(.headline)
                            }
                            else {
                                if (trsction.categ == "Groceries") {
                                    Image(systemName: "dollarsign.circle.fill")
                                        .foregroundColor(.blue)
                                    Text("-\(trsction.amount, specifier: "%.2f")")
                                        .font(.headline)
                                }
                                else {
                                    Image(systemName: "bolt.fill")
                                        .foregroundColor(.blue)
                                    Text("-\(trsction.amount, specifier: "%.2f")")
                                        .font(.headline)
                                }
                            }
                        }
                        Text(getDate(date: trsction.date))
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .environmentObject(account)
                
            }
            .padding()
        }
    }
    
    func getDate(date : Date) -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = .short
        return dateFormat.string(from: date)
    }
    
    
}

#Preview {
    ContentView()
        .environmentObject(Account())
}
