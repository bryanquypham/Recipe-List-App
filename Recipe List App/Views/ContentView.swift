//
//  ContentView.swift
//  Recipe List App
//
//  Created by Bryan Pham on 2021-10-25.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var models = RecipeModel()
    
    var body: some View {
      
        NavigationView {
            List (models.recipes) { r in
                
                NavigationLink(destination: RecipeDetailedView(recipe: r), label: {
                    
                    HStack(spacing: 20.0){
                        Image(r.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50, alignment: .center)
                            .clipped()
                            .cornerRadius(5)
                        Text(r.name)
                    }
                })
                
            }
            .navigationBarTitle("All Recipes")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
