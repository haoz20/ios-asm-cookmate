//
//  RecipeDetailView.swift
//  CookMate
//
//  Created by Swan Htet Aung on 17/9/25.
//

import SwiftUI
import SwiftData

struct RecipeDetailView: View {
    var recipe: Recipe
    
    @Environment(\.modelContext) private var modelContext
    
    @Query private var savedRecipes: [Recipe]
    
    
    private var isFavorite: Bool {
        savedRecipes.contains{ $0.id == recipe.id }
    }
    
    var body: some View {
        ScrollView {
            
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    toggleFavorite()
                } label: {
                    Text(!isFavorite ? "Favorite" : "UnFavorite")
                }
            }
        }
    }
    
    private func toggleFavorite() {
        if isFavorite {
            if let itemToDelete = savedRecipes.first(where: { $0.id == recipe.id }) {
                modelContext.delete(itemToDelete)
            }
        } else {
            recipe.isFavorite = true
            modelContext.insert(recipe)
        }
    }
    
}
