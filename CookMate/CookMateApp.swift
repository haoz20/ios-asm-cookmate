//
//  CookMateApp.swift
//  CookMate
//
//  Created by Swan Htet Aung on 16/9/25.
//

import SwiftUI
import SwiftData

@main
struct CookMateApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Recipe.self)
    }
}
