//
//  AppGradientBackground.swift
//  CookMate
//
//  Created by Swan Htet Aung on 17/9/25.
//


import SwiftUI

struct AppGradientBackground: View {
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.blue, .teal, .mint],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            LinearGradient(
                colors: [.mint.opacity(0.8), .pink.opacity(0.6)],
                startPoint: .top,
                endPoint: .bottom
            )
        }
        .ignoresSafeArea()
    }
}
