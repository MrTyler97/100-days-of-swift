//
//  ContentView.swift
//  Project1
//
//  Created by Vic  on 5/9/25.
//

import SwiftUI

// ContentView conforms to the View protocol which comes from Swift UI
struct ContentView: View {
    // @State property wrapper lets us modify our view structs freely
    @State private var name = ""
    let students = ["Vic", "Wes", "Mark"]
    @State private var keyStudent = "Vic"
    var body: some View {
        //        // Form created a container for content to go in
        //        Form{
        //            // $ -> a two-way binding: we bind the text field so that it shows the value of our property, but we also bind it so that any changes to the text field also update the property. Enables live updates, like typing in a form and seeing results update immediately
        //            TextField("Enter your name...", text: $name)
        //            Section{
        //                Text("Your name is \(name)")
        //            }
        NavigationStack {
            Form {
                Picker("Select your student", selection: $keyStudent) {
                    // id: \.self -> SwiftUI needs to be able to identify every view on the screen uniquely so it can detect when things change. Each String in the array is unique so reference itself.
                    // ForEAch creates many views
                    ForEach(students, id: \.self) { number in
                        Text(number)
                    }
                }
            }
            .navigationTitle("Select a student")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
