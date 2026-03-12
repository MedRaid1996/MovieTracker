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
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                
                // Titre du film
                Text(movie.title)
                    .font(.headline)
                
                // Genre et année
                Text("\(movie.genre) • \(movie.year)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            // Icône affichée si le film est favori
            if movie.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
        .padding(.vertical, 4)
    }
}

// Preview SwiftUI
struct MovieRowView_Previews: PreviewProvider {
    static var previews: some View {
        MovieRowView(movie: Movie(
            title: "Inception",
            genre: "Science-fiction",
            year: 2010,
            description: "Un voleur infiltre les rêves pour voler des secrets.",
            isFavorite: true
        ))
    }
}
