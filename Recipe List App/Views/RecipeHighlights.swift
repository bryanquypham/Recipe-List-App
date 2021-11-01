//
//  RecipeHighlights.swift
//  Recipe List App
//
//  Created by Bryan Pham on 2021-11-01.
//

import SwiftUI

struct RecipeHighlights: View {
    
    var allHighlights = ""
    
    //pass in the array of strings from Highlights (Models -> Recipe)
    init (highlights: [String]) {
        
        //loop through the highlights and build the string
        //we loop through and build the string because we want a comma in btwn every highlight
        for index in 0..<highlights.count {
            
            
            
            //if this is the last item, do not add a comma
            if index == highlights.count - 1 {
                allHighlights += highlights[index]
            }
            else {
                allHighlights += highlights[index] + ", "
            }
        }
        
        
    }
    
    var body: some View {
        Text(allHighlights)
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["test1", "test2"])
    }
}
