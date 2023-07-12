//
//  list.swift
//  WordScramble
//
//  Created by Brandon Johns on 7/11/23.
//

// List rely on the most
// scrolling list of date


// form is user input data

//Section headers can only be passed if they are strings

import SwiftUI

struct list: View {
    let people = ["Anakin", "Obi Wan", "Yoda", "Qui-Gon Jinn"]
    var body: some View {
        List(people, id: \.self) {
            Text($0)
            
//            Section("Section 1") {
//                Text("Static Row 1")
//                Text("Static Row 2")
//            }
//            Section("Section 2") {
//                ForEach (0..<5) {
//                    Text("Dynamic row \($0)")
//                }
//            }
//            Section("Section 2") {
//                Text("Static Row 3")
//            }
          
        }
        .listStyle(.grouped)
    }
}

struct list_Previews: PreviewProvider {
    static var previews: some View {
        list()
    }
}
