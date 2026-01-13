//
//  SheetView'.swift
//  IP20-Mynance
//
//  Created by Mahesh, Harshitha on 5/8/25.
//

import Foundation
import SwiftUI

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var balance : String = ""
    @State var selectedCategory = ""
    @State var description = ""
    
    @EnvironmentObject var account : Account
    
    var body: some View {
        NavigationStack {
            Text("Amount")
                .multilineTextAlignment(.trailing)
                .foregroundColor(.gray)
                .navigationTitle("New Transaction")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Cancel", action: {
                            dismiss()
                        })
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Save", action: {
                            addAnother()
                            dismiss()
                        })
                    }
                }
            List {
                TextField("$0.00", text: $balance)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.trailing)
                
                
                Picker("Select Category", selection: $selectedCategory) {
                    ForEach(category.allCases) { theme in
                        Text(theme.rawValue).tag(theme)
                    }
                }
                .pickerStyle(.segmented)
                
                TextField("Enter Description", text: $description)
                    .multilineTextAlignment(.leading)
                
            }
        }
    }
    
    func addAnother() {
        print("works")
        account.addOne(categ: selectedCategory, amount: Double(balance)!, descr: description)
        if (selectedCategory == "Income") {
            account.addBalance(bal: Double(balance)!)
        }
        else {
            account.addBalance(bal: -1 * Double(balance)!)

        }
    }
}

#Preview {
    SheetView().environmentObject(Account())
}
