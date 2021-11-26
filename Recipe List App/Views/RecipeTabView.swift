//
//  RecipeTabView.swift
//  Recipe List App
//
//  Created by Bryan Pham on 2021-10-28.
//

import SwiftUI

struct RecipeTabView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    @State var selectedTab = Constants.featuredTab
    
    var body: some View {
        
        TabView (selection: $selectedTab) {
            
            RecipeFeaturedView()
                .tabItem {
                    VStack{
                        Image(systemName: "star")
                        Text("Featured")
                    }
                }
                .tag(Constants.featuredTab)
            
            RecipeCategoryView(selectedTab: $selectedTab)
                .tabItem {
                    VStack{
                        Image(systemName: "square.grid.2x2")
                        Text("Categories")
                    }
                }
                .tag(Constants.categoriesTab)
                
            
            ContentView()
                .tabItem {
                    VStack {
                        Image (systemName: "list.bullet")
                        Text ("Recipe List")
                    }
                }
                .tag(Constants.listTab)
            
        }
        .environmentObject(RecipeModel())
        
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
