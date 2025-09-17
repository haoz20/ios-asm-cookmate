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
            ScrollView(.vertical) {
                RecipesGridView(recipes: recipes)
            }
            .scrollIndicators(.hidden)
            .padding(.horizontal)
            .navigationTitle("Cook Mate")
            .navigationDestination(for: Recipe.self) { selectedRecipe in
                RecipeDetailView(recipe: selectedRecipe)
            }
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        FavoriteRecipesView()
                    } label: {
                        Image(systemName: "heart")
                            .foregroundStyle(.red)
                    }

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
