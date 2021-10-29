//
//  RecipeTabView.swift
//  Recipe List App
//
//  Created by Bryan Pham on 2021-10-28.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        
        TabView{
            
            Text("Featured View")
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
        
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
