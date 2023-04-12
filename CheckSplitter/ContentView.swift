//
//  ContentView.swift
//  CheckSplitter
//
//  Created by Matthew RIley on 4/11/23.
//

import SwiftUI

struct ContentView: View {
    
    // Specifying the value is a Double (AKA A Decimal value)
    @State var checkAmount: Double = 0
    
    @State var numOfPeople = 0
    
    @State var tipPercent = 0
    
    // Tip Percentage options used in Picker below
    let tipPercentages = [0, 10, 15, 20]
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section {
                    
                    // Specifying the format to be the USD currency code so it will display in US Dollars
                    TextField("$0.00", value: $checkAmount, format: .currency(code: "USD"))
                    
                    Picker("Number of People", selection: $numOfPeople){
                        
                        // Setting the range of options from 0 to 10 and creating a Text element/option for each value
                        ForEach(0..<11){ num in
                            
                            // Using String() to convert the num INT value to a String so it can be displayed in the Text element
                            Text(String(num))
                        }
                    }
                }
                
                Section(header: Text("Select Tip Percentage")) {
                    
                    
                    Picker("Tip Percentage", selection: $tipPercent) {
                        
                        // Looping through the Int values in the tipPercentages array to create a Picker option for each percent
                        ForEach(tipPercentages, id: \.self) { prct in
                            
                            // Using the percent format to display the values as percentages
                            Text(prct, format: .percent)
                        }
                    }
                    // Using the segmented picker style to display the options in a row
                    .pickerStyle(.segmented)
                    
                }
                
                Button {
                    print("Hello World")
                } label: {
                    Text("CLICK TO SPLIT CHECK")
                }

                Section(header: Text("Each person pays...")) {
                    Text("$0.00")
                }
            }
            .navigationTitle("Check Splitter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
