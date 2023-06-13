//
//  ContentView.swift
//  WordScramble
//
//  Created by Brandon Johns on 6/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords =  [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    @State private var score = 0
    var body: some View {
        
        NavigationView
        {
            
            List
            {
                Section("Your score is: ")
                {
                    Text("\(score)")
                        .foregroundColor(.blue)
                }
                Section
                {
                    TextField("Enter your word", text: $newWord)
                        .autocapitalization(.none)
                        .foregroundColor(.teal)
                }
                Section
                {
                    ForEach(usedWords, id: \.self )                                     //id: \.self every item in the array is unique
                    { word in
                        HStack
                        {
                            Image(systemName: "\(word.count).circle")
                                .foregroundColor(.teal)
                            Text(word)
                                .foregroundColor(.teal)
                        }
                    }
                }
                
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $showingError)
            {
                Button("OK", role: .cancel){}
            } message:
            {
                Text(errorMessage)
            }
            .toolbar{
                Button("New Game" , action: newGame)
                    .foregroundColor(.red)
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView
{
    func addNewWord()
    {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else {return}
        
        
        guard isOriginal(word: answer) else
        {
            wordError(title: "Word used already", message: "Be more original!")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You cannot spell that word from '\(rootWord)'!")
            return
            
        }
        
        guard isReal(word: answer ) else
        {
            
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        if answer.count < 3
        {
            wordError(title: "Word not possible", message: "Words must be greater than 3 letters")
            return
            
        }
        
        switch answer.count
        {
        case 4:
            score += 4
        case 5:
            score += 5
        case 6:
            score += 6
        case 7:
            score += 7
        default:
            score += 3
        }
        
        
        withAnimation
        {
            usedWords.insert(answer, at: 0)
            newWord = ""
        }
    }
    
    
    
    func startGame()
    {
        
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt")
        {          // all words from start.txt file are in  startWords
            if let startWords = try? String(contentsOf: startWordsURL)
            {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        
        
        fatalError("Could not load start.txt from bundle")
    }
    
    
    func isOriginal(word: String) -> Bool
    {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool
    {
        var tempWord = rootWord
        
        for letter in word
        {
            if let possibleWord = tempWord.firstIndex(of: letter)
            {
                tempWord.remove(at: possibleWord)
            }
            else
            {
                return false
            }
        }
        return true
    }
    
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String)
    {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
    func newGame()
    {
        score = 0
        usedWords.removeAll()
        startGame()
    }
    
}

