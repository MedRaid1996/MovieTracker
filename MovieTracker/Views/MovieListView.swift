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
    
    // ViewModel utilisé pour gérer les données de la liste
    @StateObject private var movieViewModel = MovieViewModel()
    
    // Texte saisi dans la barre de recherche
    @State private var searchText = ""
    
    // Liste filtrée selon la recherche
    var filteredMovies: [Movie] {
        if searchText.isEmpty {
            return movieViewModel.movies
        } else {
            return movieViewModel.movies.filter {
                $0.title.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                // Boucle sur les films filtrés
                ForEach(filteredMovies) { movie in
                    
                    NavigationLink(destination: MovieDetailView(movie: movie)) {
                        MovieRowView(
                            movie: movie,
                            onFavoriteTap: {
                                movieViewModel.toggleFavorite(movie)
                            }
                        )
                    }
                    // Menu affiché avec un appui long
                    .contextMenu {
                        Button {
                            movieViewModel.toggleFavorite(movie)
                        } label: {
                            Label(
                                movie.isFavorite ? "Retirer des favoris" : "Ajouter aux favoris",
                                systemImage: movie.isFavorite ? "heart.slash" : "heart"
                            )
                        }
                    }
                }
                // Suppression par swipe
                .onDelete { indexSet in
                    let moviesToDelete = indexSet.map { filteredMovies[$0] }
                    
                    for movie in moviesToDelete {
                        if let realIndex = movieViewModel.movies.firstIndex(where: { $0.id == movie.id }) {
                            movieViewModel.movies.remove(at: realIndex)
                        }
                    }
                }
            }
            .navigationTitle("Mes films")
            .toolbar {
                EditButton()
            }
            // Barre de recherche
            .searchable(text: $searchText, prompt: "Rechercher un film")
        }
    }
}

// Preview SwiftUI
struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
