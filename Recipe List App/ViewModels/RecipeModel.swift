//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Bryan Pham on 2021-10-25.
//

import Foundation


class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init () {
        
        //create an instance of DataService and get the data
        
        let service = DataService()
        self.recipes = service.getLocalData()
    }
    
}
