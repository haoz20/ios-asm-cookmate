import Foundation
import SwiftData

@Model
class Recipe {
    var id: String
    var name: String
    var ingredients: [String]
    var instructions: [String]
    var image: String
    var tags: [String]
    var caloriesPerServing: Int
    var isFavorite: Bool = false
    
    init(from dto: RecipeDTO, isFavorite: Bool = false) {
        self.id = dto.id
        self.name = dto.name
        self.ingredients = dto.ingredients
        self.instructions = dto.instructions
        self.image = dto.image
        self.tags = dto.tags
        self.caloriesPerServing = dto.caloriesPerServing
        self.isFavorite = isFavorite
    }

    func toDTO() -> RecipeDTO {
        .init(
            id: id,
            name: name,
            ingredients: ingredients,
            instructions: instructions,
            image: image,
            tags: tags,
            caloriesPerServing: caloriesPerServing
        )
    }
}

struct RecipeDTO: Codable, Identifiable {
    let id: String
    let name: String
    let ingredients: [String]
    let instructions: [String]
    let image: String
    let tags: [String]
    let caloriesPerServing: Int
    
}

struct RecipeResponse: Codable {
    let recipes: [RecipeDTO]
}
