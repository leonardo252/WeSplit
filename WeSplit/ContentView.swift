//
//  ContentView.swift
//  WeSplit
//
//  Created by Leonardo Gomes on 12/04/20.
//  Copyright © 2020 Leonardo Gomes. All rights reserved.
//

import SwiftUI

/*
struct ContentView: View {
    var body: some View {
        Form {
            Section {
                Text("Hello, Love of my life!")
                Text("Hello, Love of my life!")
                Text("Hello, Love of my life!")
                Text("Hello, Love of my life!")
                Text("Hello, Love of my life!")
                Text("Hello, Love of my life!")
                Text("Hello, Love of my life!")
                Text("Hello, Love of my life!")
                Text("Hello, Love of my life!")
                Text("Hello, Love of my life!")
            }
            Group {
                Text("Hello, Love of my life!")
                Text("Hello, Love of my life!")
                Text("Hello, Love of my life!")
                Text("Hello, Love of my life!")
                Text("Hello, Love of my life!")
            }
        }
    }
}
*/

/*
struct ContentView: View {
    @State private var tapCount = 0
    @State private var name = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Hello, Love of my life!")
                    TextField("Enter your name", text: $name)
                    Text("Your name is \(name)")
                    Button("Tap Count \(tapCount)") {
                        self.tapCount += 1
                    }
                }
            }
            /*Button("Tap Count \(tapCount)") {
                self.tapCount += 1
            }*/
            //.navigationBarTitle("Pass a plain text, not a text view")
            .navigationBarTitle(Text("SwiftUI"), displayMode: .inline)
        }
    }
}
*/

/*
struct ContentView: View {
    let houses = ["Gryffindor", "Hufflepuff", "Ravenclaw", "Slytherin"]
    @State private var selectedHouse = "Slytherin"
    
    var body: some View {
        NavigationView {
            /*Form {
                ForEach(0 ..< 100) {
                    Text("Row \($0)")
                }
            }*/
            Picker("Select your house", selection: $selectedHouse) {
                ForEach(0 ..< houses.count) {
                    Text(self.houses[$0])
                }
            }
            .navigationBarTitle(Text("SwiftUI"), displayMode: .inline)
        }
    }
}
*/

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        
        if let orderAmount = Double(checkAmount) {
            let grandTotal = orderAmount * (1 + (tipSelection / 100))
            return grandTotal / peopleCount
        }
        return 0
    }
    
    var totalAmount: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        
        if let orderAmount = Double(checkAmount) {
            return orderAmount * (1 + (tipSelection / 100))
        }
        
        return 0
    }
    
    var body: some View {
            NavigationView {
                Color.purple
                    .overlay(
                Form {
                    
                    Section (header: Text("The Amount of the bill:").foregroundColor(.black).font(.system(size: 17))){
                        TextField("Amount", text: $checkAmount)
                            .keyboardType(.decimalPad)
                    }
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) People")
                        }
                    }
                    
                    Section(header: Text("How much tip do you want to leave?").foregroundColor(.black).font(.system(size: 17))){
                        Picker("Tip percentage", selection: $tipPercentage) {
                            ForEach(0 ..< tipPercentages.count) {
                                Text("\(self.tipPercentages[$0])%")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    Section(header: Text("Total amount with tip").foregroundColor(.black).font(.system(size: 17))){
                        Text("$\(totalAmount, specifier: "%.2f")")
                    }
                    
                    Section(header: Text("Amount per person").foregroundColor(.black).font(.system(size: 17))){
                        Text("$\(totalPerPerson, specifier: "%.2f")")
                    }
                    
                })
                
                .navigationBarTitle(Text("WeSplit"), displayMode: .automatic)
                
            }
    }
}

 
 
 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
