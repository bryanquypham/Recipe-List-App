//
//  Recipe.swift
//  Recipe List App
//
//  Created by Bryan Pham on 2021-10-25.
//

import Foundation

class Recipe: Identifiable, Decodable {
    
    var id:UUID?
    
    var name:String
    var category: String
    var featured:Bool
    var image:String
    var description:String
    var prepTime:String
    var cookTime:String
    var totalTime:String
    var servings:Int
    var ingredients:[Ingredient]
    var directions:[String]
    var highlights:[String]
    
}

class Ingredient: Identifiable, Decodable {
    
    var id:UUID?
    var name:String
    var num:Int?
    var denom:Int?
    var unit:String?
    
}

