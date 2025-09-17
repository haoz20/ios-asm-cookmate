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
            .navigationTitle("Cook Mate")
            .navigationBarTitleDisplayMode(.automatic)
            .background(AppGradientBackground())
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
