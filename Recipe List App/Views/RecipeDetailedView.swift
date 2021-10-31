//
//  RecipeDetailedView.swift
//  Recipe List App
//
//  Created by Bryan Pham on 2021-10-25.
//

import SwiftUI

struct RecipeDetailedView: View {
    
    var recipe:Recipe
    
    @State var selectedServingSize = 2
    
    var body: some View {
       
        
        ScrollView{
            
            Image(recipe.image)
                .resizable()
                .scaledToFill()
            
            VStack (alignment: .leading) {
                Text("Select your Serving Size")
                Picker ("", selection: $selectedServingSize) {
                    Text("2").tag(2)
                    Text("4").tag(4)
                    Text("6").tag(6)
                    Text("8").tag(8)
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 200)
            }
            .padding()
            
            VStack(alignment: .leading) {
                Text("Ingredients")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.vertical, 5)
                
                //with the update, we no longer need the id paramter, because ingredients is an identifiable object. We also added ".name" to item, because the item is now an ingredient
                ForEach (recipe.ingredients) {item in
                    
                    Text("-  " + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + item.name.lowercased())
                        
                }
            }

            Divider()
            
            VStack (alignment: .leading) {
                Text("Directions")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.vertical, 5)
                    .padding(.horizontal)
                
                ForEach (0..<recipe.directions.count, id: \.self) { index in
                    
                    Text(String(index+1) + ". " + recipe.directions[index])
                        .padding(.bottom, 0.3)
                        .padding(.trailing, 2)
                }
            }
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = RecipeModel()
        
        RecipeDetailedView(recipe: model.recipes[0])
    }
}
