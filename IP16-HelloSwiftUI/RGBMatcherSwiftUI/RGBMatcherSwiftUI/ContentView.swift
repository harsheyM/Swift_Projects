//
//  ContentView.swift
//  RGBMatcherSwiftUI
//
//  Created by Mahesh, Harshitha on 3/28/25.
//

import SwiftUI

struct ContentView: View {
    @State private var startTime = Date.now
    @State var start = true
    @State private var timeElapsed = 0
    @State private var timedEnd = false
    @State private var countDown = 10
    @State var timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    @State private var clickedSlider = false
    
    @State var ogRed : Double = 0
    @State var ogGreen : Double = 0
    @State var ogBlue : Double = 0
    
    @State var red : Float = 0
    @State var green : Float = 0
    @State var blue : Float = 0
    
    
    @State var score = 0
    
    var body: some View {
        VStack {
            Text ("\(countDown - timeElapsed)")
                .onReceive(timer) { firedDate in
            if (clickedSlider) {
//                setUpNewColor()
                timeElapsed = Int(firedDate.timeIntervalSince(startTime))}
                if (timeElapsed == 10) {
                    calculateScore()
                    timer.upstream.connect().cancel()
                    timedEnd = true
                }
            }
            HStack() {
                Rectangle()
                    .fill(Color(red: ogRed, green: ogGreen, blue: ogBlue))
                    .frame(width: 170, height: 260)
                    .position(x: 100, y: 180)
                Rectangle()
                    .fill(Color(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue)))
                    .frame(width: 170, height: 260)
                    .position(x: 90, y: 180)
                
            }
            HStack() {
                Text("My color")
                    .position(x: 100, y: 100)
                Text("Match this color")
                    .position(x: 90, y: 100)
            }
            VStack {
                HStack(spacing: -70.0) {
                    Text("R")
                        .position(y: -50)
                    Slider(
                        value: $red,
                        in: 0...1) { didChange in
                            clickedSlider = true
                        }
                    .position(y: -50)
                }
                .padding(20.0)
                HStack(spacing: -70.0) {
                    Text("G")
                        .position(y: -80)
                    Slider(
                        value: $green,
                        in: 0...1) { didChange in
                            clickedSlider = true
                        }
                    .position(y: -80)
                }
                .padding(20.0)
                HStack(spacing: -70.0) {
                    Text("B")
                        .position(y: -110)
                    Slider(
                        value: $blue,
                        in: 0...1) { didChange in
                            clickedSlider = true
                        }
                    .position(y: -110)
                }
                .padding(20.0)
            }
            
            .alert("Game Over! Score: \(score)", isPresented: $timedEnd) {
                    Button("Restart", role: .cancel) {
                        timeElapsed = 0
                        startTime = Date.now
                        timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
                        score = 0
                        red = 0
                        green = 0
                        blue = 0
                        
                    }
            }
            .onAppear(){
                setUpNewColor()
            }
        }
        
    }
    func calculateScore() {
        let rDiff : Double =  ogRed - Double(red)
        let gDiff : Double = ogGreen - Double(green)
        let bDiff : Double = ogBlue - Double(blue)
        let sqrRoot = sqrt(pow(rDiff, 2) + pow(gDiff, 2) + pow(bDiff, 2))
        score = Int(round((1 - sqrRoot) * 100))
    }
    
    func setUpNewColor() {
        ogRed = Double.random(in: 0..<1)
        ogGreen = Double.random(in: 0..<1)
        ogBlue = Double.random(in: 0..<1)
    }
}


#Preview {
    ContentView()
}
