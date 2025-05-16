//
//  ContentView.swift
//  Guess The Flag
//
//  Created by Vic  on 5/15/25.
//

// Different view stacks, Vstack -> vertical view, Hstack -> horizontal view, Zstack -> depth view - layers views (adding text over an image)
//.ignoreSafeArea allow you to fill entire screen
//.background(.ultrThinMaterial) is used often in Swfit UI for frosted window effect.
//Gradients -> LinearGradient (Goes in one direction),              RadialGradient(Outward circle),AngularGradient(Cycles around point) '.gradient' is used often in swift to make designs better. Use this after any color
// Images - > Image(decorative: "nameOfFile") the files would be stored in assets. 'systemName:' -> uses Apple’s SF Symbols icon collection, and you can search for icons you like
// Alerts - > .alert() creates a pop up on the screen.

import SwiftUI

struct ContentView: View {
    @State private var showAlert = false

    var body: some View {
        Button("Delete", role: .destructive) {
            showAlert = true
        }
        .buttonStyle(.bordered)
        .alert("Important", isPresented: $showAlert) {
            Button("Delete", role: .destructive) {}
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Are you sure you want to delete this?")
        }
        //.ignoreSafeArea allow you to fill entire screen
        //.background(.ultrThinMaterial) is used often in Swfit UI for frosted window effect.
    }
}

#Preview {
    ContentView()
}
