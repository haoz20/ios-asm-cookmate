//
//  TagCard.swift
//  CookMate
//
//  Created by Swan Htet Aung on 17/9/25.
//

import SwiftUI

// Liquid Glass TagCard
struct TagCard: View {
    
    var tag: String
    
    var body: some View {
        Text(tag)
            .font(.caption)
            .fontWeight(.medium)
            .foregroundStyle(.black)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(.ultraThinMaterial)
            .overlay(
                LinearGradient(
                    colors: [.white.opacity(0.4), .white.opacity(0.1)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .clipShape(Capsule())
            .overlay(
                Capsule()
                    .stroke(.white.opacity(0.2), lineWidth: 1)
            )
            .shadow(color: .black.opacity(0.15), radius: 5, y: 3)
    }
}

#Preview {
    TagCard(tag: "Liquid Glass")
}
