//
//  RecipeCategoryView.swift
//  Recipe List App
//
//  Created by Bryan Pham on 2021-11-26.
//

import SwiftUI

struct RecipeCategoryView: View {
    
    @EnvironmentObject var model: RecipeModel
    
    @Binding var selectedTab: Int
    
    var body: some View {
        
        VStack (alignment: .leading) {
            
            Text("Categories")
                .font(Font.custom("Avenir Heavy", size: 30))
            
            GeometryReader { geo in
                
                ScrollView (showsIndicators: false) {
                    
                    LazyVGrid (columns: [GridItem(.flexible(), spacing: 20, alignment: .top), GridItem(.flexible(), spacing: 20, alignment: .top)], alignment: .center, spacing: 20) {
                        
                        ForEach(Array(model.categories), id: \.self) { category in
                            
                            Button(action: {
                                
                                //SWITCH TABS TO LIST VIEW
                                selectedTab = Constants.listTab
                                
                                
                                //SET THE SELECTED CATEGORY
                                model.selectedCategory = category
                            },
                                   label: {
                                VStack {
                                    Image(category.lowercased())
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: (geo.size.width - 20) / 2, height: (geo.size.width - 20) / 2)
                                        .cornerRadius(10)
                                        .clipped()
                                    Text(category)
                                        .foregroundColor(.black)
                                }
                                
                            })
                            
                        }
                        
                    }
                    .padding(.bottom)
                }
                
                
            }
            
            
            
        }
        .padding(.horizontal)
        
    }
}

