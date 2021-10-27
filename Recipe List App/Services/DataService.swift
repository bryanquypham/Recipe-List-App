//
//  DataService.swift
//  Recipe List App
//
//  Created by Bryan Pham on 2021-10-25.
//

import Foundation


class DataService {
    
    func getLocalData() -> [Recipe] {
        
        //parse the json file
        
        //get url path to json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        //check if pathstring is not nil, otherwise...
        //a gaurd statement is a way of making sure something is true before continuing
        guard pathString != nil else {
            return [Recipe]()
        }
        //create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            //create data object
            let data = try  Data(contentsOf: url)
            
            //decode data with JSON decoder
            let decoder = JSONDecoder()
            
            //put it into its own do/catch block to catch the different errors
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                //@ unique ids
                for r in recipeData{
                    r.id = UUID()
                }
                
                //return the recipes
                return recipeData
            }
            catch{
                //error wutg parsing json
                print(error)
            }
            
        }
        catch {
            //error getting data
            print(error)
        }
        
        
        //if the above fails - ie we cant get the url, we still have to return something. So we will return an empty Recipe
       return [Recipe]()
        
        
    }
    
}
