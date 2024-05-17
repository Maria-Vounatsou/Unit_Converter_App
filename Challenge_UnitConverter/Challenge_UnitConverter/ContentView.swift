//
//  ContentView.swift
//  Challenge_UnitConverter
//
//  Created by Maria Vounatsou on 12/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedValue = ""
    @State private var inputValue = 0
    @State private var outputValue = 0
    
    let options = ["Meter", "Kilometers", "Yards", "Miles", "Feet"]

    
    let convertedValue: ((Int, Int, String) -> Double) = { inputValue, outputValue, selectedValue in
        
        switch (inputValue, outputValue) {
        case (0, 0): return  Double(selectedValue) ?? 0
        case (0, 1): return (Double(selectedValue) ?? 0) * 0.001
        case (0, 2): return (Double(selectedValue) ?? 0) * 1.09361
        case (0, 3): return (Double(selectedValue) ?? 0) * 0.000621371
        case (0, 4): return (Double(selectedValue) ?? 0) * 0.3048
            
        case (1, 0): return (Double(selectedValue) ?? 0) * 1000
        case (1, 1): return  Double(selectedValue) ?? 0
        case (1, 2): return (Double(selectedValue) ?? 0) * 1093.61
        case (1, 3): return (Double(selectedValue) ?? 0) * 0.621371
        case (1, 4): return (Double(selectedValue) ?? 0) * 0.0003048
            
        case (2, 0): return (Double(selectedValue) ?? 0) * 0.9144
        case (2, 1): return (Double(selectedValue) ?? 0) * 0.0009144
        case (2, 2): return  Double(selectedValue) ?? 0
        case (2, 3): return (Double(selectedValue) ?? 0) * 0.000568182
        case (2, 4): return (Double(selectedValue) ?? 0) * 3
            
        case (3, 0): return (Double(selectedValue) ?? 0) * 1609.34
        case (3, 1): return (Double(selectedValue) ?? 0) * 1.60934
        case (3, 2): return (Double(selectedValue) ?? 0) * 1760
        case (3, 3): return  Double(selectedValue) ?? 0
        case (3, 4): return (Double(selectedValue) ?? 0) * 5280
            
        case (4, 0): return (Double(selectedValue) ?? 0) * 0.3048
        case (4, 1): return (Double(selectedValue) ?? 0) * 0.0003048
        case (4, 2): return (Double(selectedValue) ?? 0) * 0.333333
        case (4, 3): return (Double(selectedValue) ?? 0) * 0.000189394
        case (4, 4): return  Double(selectedValue) ?? 0
            
        default:
            return 0
        }
    }
    
    
    var body: some View {
        
        ZStack {
            Image("background-wood-grain")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Spacer()
                
                NavigationStack {
                    Form {
                        Section("Select an option") {
                            TextField("Place a value", text: $selectedValue)
                            Picker("Option: ", selection: $inputValue) {
                                ForEach(0..<options.count, id: \.self) {
                                    Text(options[$0])
                                }
                            }
                            .pickerStyle(.segmented)
                            .bold()
                        }
                        .mTitle()  
                        Section("The output Value") {
                            Picker("Option: ", selection: $outputValue) {
                                ForEach(0..<options.count, id: \.self) {
                                    Text(options[$0])
                                }
                            }
                            .pickerStyle(.segmented)  // .pickerStyle(.wheel)
                        }
                        .mTitle()
                        Text("Outcome: \(convertedValue(inputValue, outputValue, selectedValue))")
                    }
                    .navigationTitle("Lenght Converter")
                    .navigationBarTitleTextColor(Color("ColorV"))
                    .foregroundColor(Color("ColorR"))
                    Text("For good measurements")
                        .mTitle()    //.modifier(SideTitle())  without the accompanying View extension
        
                    Image("length")
                }
                Spacer()
            }
        }
    }
}

struct SideTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color("ColorB"))
            .bold()
            .font(.headline)
    }
}

extension View {
    func mTitle() -> some View {
        modifier(SideTitle())
    }
}

extension View {
    @available(iOS 14, *)
    func navigationBarTitleTextColor(_ color: Color) -> some View {
        let uiColor = UIColor(color)
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: uiColor ]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: uiColor ]
        return self
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
