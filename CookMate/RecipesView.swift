//
//  RecipesView.swift
//  CookMate
//
//  Created by Swan Htet Aung on 16/9/25.
//

import SwiftUI

struct RecipesView: View {
    @State private var recipesVM: RecipesViewModel = RecipesViewModel()
    @State var recipes: [Recipe] = []
    
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                RecipesGridView(recipes: recipes)
            }
            .padding(.horizontal)
            .navigationTitle("Cook Mate")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "heart")
                    }
                    .tint(.red)
                }
            }
        }
        .task {
            await recipesVM.loadRecipes()
            self.recipes = recipesVM.recipes
        }
    }
}

#Preview {
    RecipesView()
}
