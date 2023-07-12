//
//  WorkingWithStrings.swift
//  WordScramble
//
//  Created by Brandon Johns on 7/11/23.
//

import SwiftUI

struct WorkingWithStrings: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    func test()
    {
        
        let word = "swift"
        let checker = UITextChecker()
        
        let range = NSRange(location: 0, length: word.utf16.count)
        
        let missspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        let allGood = missspelledRange.location == NSNotFound // true of word is spelled correctly 
        
        
//        let input = """
//                    a
//                    b
//                    c
//                    """
//        let letters = input.components(separatedBy: "\n")
//        let letter = letters.randomElement()
//        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
        
    }
}

struct WorkingWithStrings_Previews: PreviewProvider {
    static var previews: some View {
        WorkingWithStrings()
    }
}
