//
//  ContentView.swift
//  StopWatchSwiftUI
//
//  Created by Mahesh, Harshitha on 3/28/25.
//

import SwiftUI

struct ContentView: View {
    @State private var startTime = Date.now
    @State private var runningNow = false
    @State private var timeElapsed = 0
    @State var timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack {
            Text("\(timeElapsed)")
                .padding()
                .padding()
                .font(.largeTitle)
                .onReceive(timer) { firedDate in
                    if (runningNow) {
                        timeElapsed = Int(firedDate.timeIntervalSince(startTime))
                    }
            
            }
            Button("Start", action: {
                runningNow = true
                timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
                
            })
            .padding()
            Button("Stop") {
                runningNow = false
                timer.upstream.connect().cancel()
            }
            .padding()
            Button("Reset") {
                timeElapsed = 0
            }
            .padding()
        }
        .padding()
    }
    
}

#Preview {
    ContentView()
}
