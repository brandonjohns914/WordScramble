//
//  LoadingResourcesFromBundle.swift
//  WordScramble
//
//  Created by Brandon Johns on 7/11/23.
//

import SwiftUI

struct LoadingResourcesFromBundle: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    func loadFile() {
        // where does file exist
        if let fileURL = Bundle.main.url(forResource: "Some-File", withExtension: "txt") {
            if let fileContents = try? String(contentsOf: fileURL) {
                
                // loads file into the string
                
                
            }
        }
    }
}

struct LoadingResourcesFromBundle_Previews: PreviewProvider {
    static var previews: some View {
        LoadingResourcesFromBundle()
    }
}
