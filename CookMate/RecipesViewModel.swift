//
//  RecipesViewModel.swift
//  CookMate
//
//  Created by Swan Htet Aung on 16/9/25.
//

import Foundation

@Observable
class RecipesViewModel {
    var recipes: [Recipe] = []
    
    init() {
        
    }
    
    func loadRecipes() async {
        do {
            let recipesDTOs = try await fetchRecipes()
            self.recipes = recipesDTOs.map{ Recipe(from: $0) }
            print(recipesDTOs)
        } catch {
            recipes = []
            print("There is an error")
        }
    }
    
    private func fetchRecipes() async throws -> [RecipeDTO] {
        guard let baseUrl = URL(string: "https://dummyjson.com/recipes") else {
            throw URLError(.badURL)
        }
        let (data, response) = try await URLSession.shared.data(from: baseUrl)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            print("error")
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode(RecipeResponse.self, from: data).recipes
        
        
    }
    
}

