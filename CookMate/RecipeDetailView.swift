//
//  RecipeDetailView.swift
//  CookMate
//
//  Created by Swan Htet Aung on 17/9/25.
//

import SwiftUI
import SwiftData
import SDWebImageSwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    
    @Environment(\.modelContext) private var modelContext
    
    @Query private var savedRecipes: [Recipe]
    
    
    private var isFavorite: Bool {
        savedRecipes.contains{ $0.id == recipe.id }
    }
    
    var body: some View {
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 20) {
                        
                        // MARK: - 1. Image and Calorie Tag
                        ZStack(alignment: .bottomTrailing) {
                            WebImage(url: URL(string: recipe.image))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 280)
                                .clipped()
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                            
                            // Calorie tag with a glass effect
                            
                            HStack {
                                Image(systemName: "flame.fill")
                                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.red, .orange, .yellow]), startPoint: .top, endPoint: .bottom))
                                Text("\(recipe.caloriesPerServing) kcal")
                                    .font(.caption)
                                    .fontWeight(.medium)
                                    
                                    
                            } // Padding to bring it in from the corner
                            .frame(width:90, height: 30)
                            .background(.ultraThinMaterial)
                            .clipShape(Capsule())
                            .padding(10)
                        }
                        
                        // MARK: - 2. Title and Tags
                        VStack(alignment: .leading, spacing: 12) {
                            Text(recipe.name)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            
                            // Horizontal scroll view for tags
                            
                        }
                        .padding(.horizontal)
                        
                        // MARK: - Tags
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(recipe.tags, id: \.self) { tag in
                                    TagCard(tag: tag)
                                        .padding(.vertical)
                                }
                            }
                            .padding(.horizontal)
                        }
                        .scrollIndicators(.hidden)
                        
                        // MARK: - 3. Ingredients Section
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Ingredients")
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            // A styled container for the list
                            VStack(alignment: .leading, spacing: 8) {
                                ForEach(recipe.ingredients, id: \.self) { ingredient in
                                    Text("• \(ingredient)")
                                        .padding(.vertical, 2)
                                }
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(.thinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                        .padding(.horizontal)
                        
                        // MARK: - 4. Instructions Section
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Instructions")
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            VStack(alignment: .leading, spacing: 15) {
                                // Using enumerated() to get both the index and the instruction
                                ForEach(Array(recipe.instructions.enumerated()), id: \.offset) { index, instruction in
                                    HStack(alignment: .top, spacing: 10) {
                                        Text("\(index + 1).")
                                            .fontWeight(.bold)
                                        Text(instruction)
                                    }
                                }
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(.thinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                        .padding(.horizontal)
                        
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            toggleFavorite()
                        } label: {
                            Text(isFavorite ? "Unfavorite" : "Favorite")
                        }
                        .animation(.bouncy, value: isFavorite)
                    }
                }
            }.background(AppGradientBackground())
        
        .ignoresSafeArea(.container, edges: .top)
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

#Preview {
    NavigationStack {
        RecipeDetailView(
            // Create a sample Recipe object to pass to the view.
            recipe: Recipe(from: RecipeDTO(
                id: 3,
                name: "Chocolate Chip Cookies",
                ingredients: [
                    "All-purpose flour",
                    "Butter, softened",
                    "Brown sugar",
                    "White sugar",
                    "Eggs",
                    "Vanilla extract",
                    "Baking soda",
                    "Salt",
                    "Chocolate chips"
                ],
                instructions: [
                    "Preheat the oven to 350°F (175°C).",
                    "In a bowl, cream together softened butter, brown sugar, and white sugar.",
                    "Beat in eggs one at a time, then stir in vanilla extract.",
                    "Combine flour, baking soda, and salt. Gradually add to the wet ingredients.",
                    "Fold in chocolate chips.",
                    "Drop rounded tablespoons of dough onto ungreased baking sheets.",
                    "Bake for 10-12 minutes or until edges are golden brown.",
                    "Allow cookies to cool on the baking sheet for a few minutes before transferring to a wire rack."
                ],
                image: "https://cdn.dummyjson.com/recipe-images/3.webp",
                tags: [
                    "Cookies",
                    "Dessert",
                    "Baking"
                ],
                caloriesPerServing: 150
            ))
        )
    }
}

