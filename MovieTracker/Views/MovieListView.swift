//
//  MovieListView.swift
//  MovieTracker
//
//  Created by Raid on 2026-03-11.
//

import Foundation

import SwiftUI

// Vue principale qui affiche la liste des films
struct MovieListView: View {
    
    // ViewModel utilisé pour fournir les données à la vue
    @StateObject private var viewModel = MovieViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                // Boucle sur tous les films de la liste
                ForEach(viewModel.movies) { movie in
                    NavigationLink(destination: MovieDetailView(movie: movie)) {
                        VStack(alignment: .leading, spacing: 6) {
                            
                            // Titre du film
                            Text(movie.title)
                                .font(.headline)
                            
                            // Genre et année
                            Text("\(movie.genre) • \(movie.year)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical, 4)
                    }
                }
                // Permet de supprimer un film avec un swipe
                .onDelete(perform: viewModel.deleteMovie)
            }
            // Titre de la barre de navigation
            .navigationTitle("Mes films")
            
            // Bouton Edit pour activer la suppression
            .toolbar {
                EditButton()
            }
        }
    }
}

// Preview de la vue dans Xcode
struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
