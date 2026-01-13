//
//  ContentView.swift
//  BusinessCardSwiftUI
//
//  Created by Mahesh, Harshitha on 3/26/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack() {
            Image("Harshey")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 300)
                .clipShape(Circle())
            Text("Harshitha Mahesh")
        }
        .font(.title)
        Spacer()
        
        VStack {
            Text("School: Heritage High School")
            Text("Email Address: harshitha.mahesh.825@gmail.com")
        }
        
    }
}

#Preview {
    ContentView()
}
