//
//  RecipeTabView.swift
//  Recipe List App
//
//  Created by Bryan Pham on 2021-10-28.
//

import SwiftUI

struct RecipeTabView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        TabView{
            
            RecipeFeaturedView()
                .tabItem {
                    VStack{
                        Image(systemName: "star")
                        Text("Featured")
                    }
                }
                
            
            ContentView()
                .tabItem {
                    VStack {
                        Image (systemName: "list.bullet")
                        Text ("Recipe List")
                    }
                }
            
        }
        .environmentObject(RecipeModel())
        
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
