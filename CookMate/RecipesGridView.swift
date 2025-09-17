//
//  RecipesGridView.swift
//  CookMate
//
//  Created by Swan Htet Aung on 16/9/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct RecipesGridView: View {
    var recipes: [Recipe]
    
    let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 160, maximum: 220), spacing: 12, alignment: .top)
    ]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(recipes, id: \.id) { recipe in
                NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                    RecipeCard(recipe: recipe)
                }
            }
        }
        
        
        
    }
    
}


struct RecipeCard: View {
    var recipe: Recipe
    
    var body: some View {
        ZStack {
            // MARK: - 1. Background Image
            // The WebImage view from SDWebImageSwiftUI handles downloading and caching.
            WebImage(url: URL(string: recipe.image))
            // A system icon as a placeholder.
                .resizable() // Makes the image fill the frame.
                .aspectRatio(contentMode: .fill)
                .frame(width: 180, height: 220) // Defines the card's size.
            
            // MARK: - 2. Gradient Overlay
            // This gradient makes the text readable against any image.
            VStack {
                Spacer() // Pushes the gradient to the bottom.
                ZStack {
                    // A linear gradient from transparent to black.
                    LinearGradient(
                        gradient: Gradient(colors: [.black.opacity(0.0), .black.opacity(0.8)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    
                    // MARK: - 3. Recipe Name
                    Text(recipe.name)
                        .font(.headline) // A nice, readable font weight.
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.bottom, 10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(height: 60) // Sets the height of the gradient area.
            }
        }
        // MARK: - 4. Card Styling
        .frame(width: 180, height: 220) // Must match the image frame size.
        .cornerRadius(12) // Rounds the corners for a card-like feel.
        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2) // Adds depth.
    }
}

