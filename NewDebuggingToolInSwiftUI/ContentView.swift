//
//  ContentView.swift
//  NewDebuggingToolInSwiftUI
//
//  Created by Ramill Ibragimov on 19.10.2021.
//

import SwiftUI

@available(iOS 15.0, *)
struct SomeNewView: View {
    @Binding var count: String
    
    var body: some View {
        
        // debugger
        let _ = Self._printChanges()
        
        Text("Count: \(count)")
            .padding()
    }
}

@available(iOS 15.0, *)
struct ContentView: View {
    static let numbers = ["One", "Two", "Three", "Four", "Five", "Six", "Seven"]
    
    @State var count: String = numbers.randomElement()!
    
    var body: some View {
        SomeNewView(count: $count)
            .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
                count = ContentView.numbers.randomElement()!
            }
    }
}

@available(iOS 15.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
