//
//  ContentView.swift
//  TipSplitter
//
//  Created by Vic  on 5/9/25.
//

import SwiftUI

// ContentView conforms to the View protocol which comes from Swift UI
struct ContentView: View {
    // Defaults
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 1
    @State private var tipPercentage = 20
    // Making sure number keypad has bool attribute so we can close it out
    @FocusState private var isFocused: Bool

    // Presets for user to choose tip percentage
    let tipPercentengaes = [10, 15, 20, 30, 0]

    //
    var totalPerPerson: Double {
        // Convert values to double
        let peopleSelection = Double(numberOfPeople + 1)
        let tipSelection = Double(tipPercentage) / 100
        // Calculations
        let total = checkAmount + (checkAmount * tipSelection)
        let perPersonTotal = total / peopleSelection

        return perPersonTotal
    }

    var body: some View {
        NavigationStack {  // Makes a root view so u can show additional views.
            Form {
                Section {
                    // instead of 'text' param we use 'value' to pass numbers and avoid converting. 'format' param lets swift handle formatting for currency.
                    // Locale.current.currency?.identifier ?? "USD" -> Check for user preferred currency. if none give em USD
                    // .keyboardType -> Make user only able to veiw/use number keyboard.
                    // .focused -> Check if keyboard is active or not
                    TextField(
                        "Total", value: $checkAmount,
                        format: .currency(code: Locale.current.currency?.identifier ?? "USD")
                    )
                    .keyboardType(.decimalPad)
                    .focused($isFocused)

                    // Create a picker for user to choose how many people want to split the bill
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(1..<20) {
                            // $0 refers to first param. In this case its $numberOfPeople obv
                            if $0 == 1 {
                                Text("\($0) person")
                            } else {
                                Text("\($0) people")
                            }
                        }
                    }
                    .pickerStyle(.navigationLink)  // Create additional veiw
                }
                // Create new section to see percentages.
                Section("Choose Tip Percentage") {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        // Show percentage options
                        ForEach(tipPercentengaes, id: \.self) { percentage in
                            if percentage != 0 {
                                Text("\(percentage)%")
                            } else {
                                Text("No Tip")
                            }
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section {
                    Text(totalPerPerson, format: .currency(code: "USD"))
                }
                .navigationTitle("Tip Splitter")
                .toolbar {
                    // In our root display, we check to see if the keyboard is actively being used. If its being used a "Done" will display.. once cliked keyboard will dissapear
                    if isFocused {
                        Button("Done") {
                            isFocused = false
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
