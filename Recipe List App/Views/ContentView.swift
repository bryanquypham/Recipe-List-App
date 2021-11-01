//
//  ContentView.swift
//  Recipe List App
//
//  Created by Bryan Pham on 2021-10-25.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var models:RecipeModel
    
    var body: some View {
        
        NavigationView {
            
            VStack (alignment: .leading) {
                Text("All Recipes")
                    .font(Font.custom("Avenir Heavy", size: 30))
                    
                
                
                ScrollView {
                    LazyVStack (alignment: .leading) {
                        ForEach (models.recipes) { r in
                            
                            NavigationLink(destination: RecipeDetailedView(recipe: r), label: {
                                
                                HStack(spacing: 20.0){
                                    Image(r.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .clipped()
                                        .cornerRadius(5)
                                    
                                    VStack (alignment: .leading){
                                        Text(r.name)
                                            .font(Font.custom("Avenir Heavy", size: 16))
                                        RecipeHighlights(highlights: r.highlights)
                                            .foregroundColor(.black)
                                            .font(Font.custom("Avenir", size: 15))
                                    }
                                    
                                }
                            })
                            
                        }
                    }
                    
                    
                }
                
            }
            .padding(.leading)
            .navigationBarHidden(true)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(RecipeModel())
    }
}
