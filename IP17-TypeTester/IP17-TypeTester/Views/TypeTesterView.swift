//
//  TypeTesterView.swift
//  IP17-TypeTester
//
//  Created by Mahesh, Harshitha on 4/3/25.
//

import SwiftUI

struct TypeTesterView : View {
    //Timer Setup
    @State private var startTime = Date.now
    @State var start = false
    @State var firstTime = true
    @State private var timeElapsed = 0
    @State private var timedEnd = false
    @State private var countDown = 10
    @State var timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    //Game variables
    @State var correct = 0
    @State var typedWord = ""
    @State var color : Color = .blue
    @State var word = ""
    @FocusState private var isKeyFocused: Bool
    
    var body: some View {
        VStack() {
            Text ("\(countDown - timeElapsed)")
                .padding()
                .padding()
                .font(.largeTitle)
                .onReceive(timer) { firedDate in
            if (start) {
                timeElapsed = Int(firedDate.timeIntervalSince(startTime))}
                if (timeElapsed == 10) {
                    timer.upstream.connect().cancel()
                    timedEnd = true
                }
            }
                .padding()
            Text("Correct: \(correct)")
                .padding()
            
            
            Text("\(word)")
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 5.0).strokeBorder(color, style: StrokeStyle(lineWidth: 2.0)))
                .padding()
            
            TextField("Press start to play game", text: $typedWord)
                .focused($isKeyFocused)
                .autocorrectionDisabled()
                .autocapitalization(.none)
                .overlay(RoundedRectangle(cornerRadius: 5.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                .onSubmit {
                    game()
                    isKeyFocused = true
                }
                .padding()
            
            
            if (firstTime) {
                Button("Start", action: {
                    start = true
                    firstTime = false
                    timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
                    
                })
            }
            else {
                Button("Restart", action: {
                    start = true
                    timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
                    
                })
            }
        }
        .padding()
        .alert("\(correct * 6) words per minute (WPM)", isPresented: $timedEnd) {
                Button("Dismiss", role: .cancel) {
                    timeElapsed = 0
                    start = false
                    firstTime = true
                    startTime = Date.now
                    timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
                    correct = 0
                    color = .blue
                    typedWord = ""
                }
        }
        .onAppear() {
            getWord()
        }
    }
    
    func getWord() {
        var wordList = Words.wordlist
        wordList.shuffle()
        
        word = wordList[0]
    }
    
    
    func game() {
        if (typedWord == word) {
            color = .green
            correct += 1
        }
        else {
            color = .red
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
            color = .blue
            getWord()
            typedWord = ""
        }
    }
}

#Preview {
    ContentView()
}
