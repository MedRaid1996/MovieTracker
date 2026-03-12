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
    
    // Film sélectionné depuis la liste
    let movie: Movie
    
    var body: some View {
        ScrollView {
            VStack(spacing: 25) {
                
                // Poster du film en grand format
                Image(movie.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .cornerRadius(16)
                    .shadow(radius: 8)
                
                // Titre du film
                Text(movie.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                // Genre et année sans séparateur
                Text("\(movie.genre) • \(movie.year, format: .number.grouping(.never))")
                    .font(.title3)
                    .foregroundColor(.secondary)
                
                // Icône favori si le film est marqué comme favori
                if movie.isFavorite {
                    Label("Film favori", systemImage: "heart.fill")
                        .foregroundColor(.red)
                        .font(.headline)
                }
                
                Divider()
                
                // Description du film
                Text(movie.description)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
            }
            .padding()
        }
        .navigationTitle("Détail du film")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// Preview SwiftUI
struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(
            movie: Movie(
                title: "Inception",
                genre: "Science-fiction",
                year: 2010,
                description: "Un voleur infiltre les rêves pour voler des secrets.",
                imageName: "inception",
                isFavorite: false
            )
        )
    }
}
