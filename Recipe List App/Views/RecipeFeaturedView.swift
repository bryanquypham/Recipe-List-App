//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by Bryan Pham on 2021-10-29.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var models:RecipeModel
    
    @State var isDetailedViewShowing = false
    
    var body: some View {
        
        VStack (alignment: .leading, spacing: 0) {
            
            Text("Featured Recipes")
                .font(.largeTitle)
                .bold()
                .padding(.leading)
                
            
            GeometryReader { geo in
                        
                TabView {
                            
                    //Loop through each recipe.
                    //We use ForEach here because we want a UI element to be listed(?? M4L7)
                    ForEach (0..<models.recipes.count) {index in
                                
                        //Only show those that should be "featured"
                        if models.recipes[index].featured == true {
                              
                            
                            //Recipe Card button
                            
                            Button(action: {
                                
                                //show the recipe detailed sheet
                                self.isDetailedViewShowing = true
                                
                            }, label: {
                                
                                ZStack {
                                //The recipe card -- We modified the rectangle with the below code (.frame, etc) but then it wasn't being applied onto the lasagna image. So we move it to affect da whole ass ZStack.
                                    Rectangle()
                                        .foregroundColor(.white)
                                                
                                    VStack (spacing: 0) {
                                        Image(models.recipes[index].image)
                                            .resizable()
                                            .clipped()
                                            .aspectRatio(contentMode: .fill)
                                        Text(models.recipes[index].name)
                                            .padding(8)
                                                
                                    }
                                            
                                }
                                
                            })
                            //sheet = a button modifier - accepts 1 boolean parameter. True = show view, False = will hide the view. {} closure - to specify the view you wanna show. So we need to create a state variable for when we flip the boolean to true to false
                            //the variable = a binding. 2 way comm. Because when the user dismisses the card, we want the value to turn back into "false"
                            .sheet(isPresented: $isDetailedViewShowing){
                                    
                                    //we have to pass in the recipe to show
                                    RecipeDetailedView(recipe: models.recipes[index])
                                }
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width - 25, height: geo.size.height - 95, alignment: .center)
                            .cornerRadius(20)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                        }
                    }
                            
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack (alignment: .leading) {
                
                Text("Preparation Time")
                    .font(.headline)
                Text("1 Hour")
                Text("Highlights")
                    .font(.headline)
                Text("Healthy, Hearty, Easy")
                
            }.padding(.leading)
        }
        
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
