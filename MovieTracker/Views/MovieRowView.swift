//
//  MovieRowView.swift
//  MovieTracker
//
//  Created by Raid on 2026-03-11.
//

import Foundation
import SwiftUI

// Vue représentant une ligne de film dans la liste
struct MovieRowView: View {
    
    // Film affiché dans la ligne
    let movie: Movie
    
    // Action appelée quand on touche le cœur
    let onFavoriteTap: () -> Void
    
    var body: some View {
        HStack(spacing: 12) {
            
            // Poster du film
            Image(movie.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 75)
                .cornerRadius(8)
                .clipped()
            
            VStack(alignment: .leading, spacing: 6) {
                
                // Titre du film
                Text(movie.title)
                    .font(.headline)
                
                // Genre et année du film
                Text("\(movie.genre) • \(movie.year)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            // Bouton pour ajouter ou retirer des favoris
            Button(action: onFavoriteTap) {
                Image(systemName: movie.isFavorite ? "heart.fill" : "heart")
                    .foregroundColor(.red)
                    .font(.title3)
            }
            .buttonStyle(.plain)
        }
        .padding(.vertical, 4)
    }
}

// Preview SwiftUI
struct MovieRowView_Previews: PreviewProvider {
    static var previews: some View {
        MovieRowView(
            movie: Movie(
                title: "Inception",
                genre: "Science-fiction",
                year: 2010,
                description: "Un voleur infiltre les rêves pour voler des secrets.",
                imageName: "inception",
                isFavorite: true
            ),
            onFavoriteTap: {}
        )
    }
}
