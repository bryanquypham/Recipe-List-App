//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Bryan Pham on 2021-10-25.
//

import Foundation


class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    //a set is for an unordered collection of unique elements -- unique ~ will filter out duplicates
    @Published var categories = Set<String>()
    
    @Published var selectedCategory: String?
    
    init () {
        
        //create an instance of DataService and get the data
        
        let service = DataService()
        self.recipes = service.getLocalData()
    
        
        //we want an array of all the "category" strings
        self.categories = Set(self.recipes.map { r in
            return r.category
        })//we are returning all of the categories of all of the recipes and passing it into a set, which will automatically filter out duplicate categories
        self.categories.update(with: Constants.defaultListFilter)
    }
    
    
   static func getPortion(ingredient:Ingredient, recipeServings:Int, targetServings:Int) -> String {
        
       //declare a variable to store the string that we are going to return
       var portions = ""
       //over the course of the following code - we are going to add to this string
       
       //declare a variable for the numerator and assign it as the numerator of the ingredient
       //REMEMBER - this COULD be NIL. So IF it is NIL - then we are going to make it "1"
       // the ?? = a coalescing operator ~ allows for an alternative if the optional turns out to be nil.
       var numerator = ingredient.num ?? 1
       var denominator = ingredient.denom ?? 1
       var wholePortions = 0
       
       
       //if ingredient.num IS NOT NIL... And it never will be because it will be "1" if it is...
       //So here, we are actually just checking the num property of the ingredient
       if ingredient.num != nil {
        
           //get a single serving size by dividing by 6. Or multiplying the denominator by 6.
           denominator = denominator * recipeServings
           //equivalent to: "denominator *= recipeServings
           
           
           //get target servings by multiplying numerator by target serving
           numerator = numerator * targetServings
           
           //reduce the fraction by the greatest common diviser
           let divisor = Rational.greatestCommonDivisor(numerator, denominator)
           numerator = numerator / divisor
           denominator = denominator / divisor
           
           //get the whole portions if numerator > than the denominator
           if numerator >= denominator {
               
               //calculated whole portions
               wholePortions = numerator / denominator
               
               //calculated remainder
               numerator = numerator % denominator
               
               //assign to portions string
               //=+ is append
               portions += String(wholePortions)
           }
           
           
           //express the remainder as a fraction
           //have to check if wholePortions is > 0.. then we want to add a "space". If it is not > 0 then we have no space. This is basically an if statement.
           portions += wholePortions > 0 ? " " : ""
           portions += "\(numerator)/\(denominator)"
           
       }
        
       
       if var unit = ingredient.unit {
           
           //if we need to pluralize
           
           if wholePortions > 1 {
            
               //calculate appropriate suffix.
               //if the last 2 characters is a "ch"...
               if unit.suffix(2) == "ch" {
                   unit += "es"
               }
               else if unit.suffix(1) == "f" {
                   unit = String(unit.dropLast())
                   unit += "ves"
               }
               else {
                   unit += "s"
               }
                        
           }
           
           //if ingredient.num is nil AND denom is also nil then we are going to return a no space. HOWEVER in every other case - we will add a "space". This is all to calculate and add a space for the unit. It was "2cup broth" before, but now it is "2 cup"
           portions += ingredient.num == nil && ingredient.denom == nil ? "" : " "
           
           
           
           return portions + unit
       }
        
       return portions
    }
    
}
