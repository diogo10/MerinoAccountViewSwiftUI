//
//  ContentView.swift
//  AccountViewMerinoExample
//
//  Created by Diogo Ribeiro on 12/12/2020.
//

import SwiftUI
import AccountViewMerino

struct ContentView: View {
    @State private var hasTimeElapsed = false
    
    var body: some View {
            NavigationView {
                
                List {
                    Section(header: Text("Account")) {
                        
                    }
                }
                
                
                VStack {
                    Text("Hello World")
                    NavigationLink(destination: AccountView(), isActive: $hasTimeElapsed) {
                        Text("Do Something")
                    }
                }
            }.onAppear(perform: {
                delayText()
            })
        }
    
    private func delayText() {
            // Delay of 7.5 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                hasTimeElapsed = true
            }
        }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
