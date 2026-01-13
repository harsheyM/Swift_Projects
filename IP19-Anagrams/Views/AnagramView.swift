//
//  AnagramView.swift
//  IP19-Anagrams
//
//  Created by Mahesh, Harshitha on 4/24/25.
//

import SwiftUI

struct AnagramView : View {
    @StateObject var model = WordScrambleApp()
    
    @State var userWord = ""
    @State var entered = false
    @State var num = 0
    
    @FocusState private var isKeyFocused: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text(model.word)
                    .font(.title)
                    .multilineTextAlignment(.leading)
                    .padding()
                    .padding()
                    .padding()
                    .padding()
                Text("Score: \(model.score)")
                    .multilineTextAlignment(.trailing)
            }
            TextField("Enter your word", text: $userWord)
            .focused($isKeyFocused)
            .autocorrectionDisabled()
            .autocapitalization(.none)
            .onSubmit {
                changeTable()
                isKeyFocused = true
                userWord = ""
            }
            
            if (entered) {
                List {
                    ForEach(model.found, id: \.self) { word in
                        HStack {
                            Text(word)
                            Spacer()
                            if (word.count >= 3 && word.count <= 5) {
                                Text("1")
                            }
                            else if (word.count == 6) {
                                Text("2")
                            }
                            else if (word.count == 7) {
                                Text("3")
                            }
                            else if (word.count == 8) {
                                Text("4")
                            }
                            
                        }
                    }
                    
                }
                .padding()
                
            }
            Button("Restart", action: {
                model.setUp()
                userWord = ""
                entered = false
                num = 0
            })
        }
    }
    
    
    func changeTable() {
        num = 0
        num = model.checkAnagram(wordCheck: userWord)
        if (num == 0) {
            print(userWord)
        }
        entered = true
    
    }
    
}

#Preview {
    ContentView()
}
