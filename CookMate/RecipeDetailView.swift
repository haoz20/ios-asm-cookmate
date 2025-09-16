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
    var body: some View {
        ScrollView {
            
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    
                } label: {
                    Text(!recipe.isFavorite ? "Favorite" : "UnFavorite")
                }
            }
        }
    }
}
