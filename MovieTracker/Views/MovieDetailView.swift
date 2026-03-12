//
//  MovieDetailView.swift
//  MovieTracker
//
//  Created by Raid on 2026-03-11.
//

import Foundation
import SwiftUI

// Vue affichant les informations détaillées d'un film
struct MovieDetailView: View {
    
    // Film sélectionné dans la liste
    let movie: Movie
    
    var body: some View {
        VStack(spacing: 20) {
            
            // Titre du film
            Text(movie.title)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            // Genre et année
            Text("\(movie.genre) • \(movie.year)")
                .font(.title3)
                .foregroundColor(.gray)
            
            // Description du film
            Text(movie.description)
                .font(.body)
                .padding()
            
            Spacer()
        }
        .padding()
        .navigationTitle("Détail")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// Preview SwiftUI
struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: Movie(
            title: "Inception",
            genre: "Science-fiction",
            year: 2010,
            description: "Un voleur infiltre les rêves pour voler des secrets.",
            isFavorite: false
        ))
    }
}
