//
//  FavoriteRecipesView.swift
//  CookMate
//
//  Created by Swan Htet Aung on 17/9/25.
//

import SwiftUI
import SwiftData

struct FavoriteRecipesView: View {
    @Query private var favoriteRecipes: [Recipe]
    var body: some View {
        
        NavigationStack {
            Group {
                if favoriteRecipes.isEmpty {
                    ContentUnavailableView {
                        Image(systemName: "heart.slash")
                    } description: {
                        Text("Your favorite recipes will appear here")
                    }
                } else {
                    ScrollView {
                        RecipesGridView(recipes: favoriteRecipes)
                    }
                    .padding(.horizontal)
                    .scrollIndicators(.hidden)
                }
            }
            .navigationDestination(for: Recipe.self) { selectedRecipe in
                RecipeDetailView(recipe: selectedRecipe)
            }
        }
    }
}
