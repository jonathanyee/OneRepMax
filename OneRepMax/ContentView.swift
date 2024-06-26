//
//  ContentView.swift
//  OneRepMax
//
//  Created by Jonathan Yee on 6/25/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            let parser = WorkoutParser()
            let entries = parser.parse()
            print(entries)
        }
    }
}

#Preview {
    ContentView()
}
