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
    
    // Indique si on affiche seulement les favoris
    @State private var showFavoritesOnly = false
    
    // Liste filtrée selon la recherche et les favoris
    var filteredMovies: [Movie] {
        movieViewModel.movies.filter { movie in
            let matchesSearch = searchText.isEmpty || movie.title.localizedCaseInsensitiveContains(searchText)
            let matchesFavorite = !showFavoritesOnly || movie.isFavorite
            return matchesSearch && matchesFavorite
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

                // Menu de tri
                Menu {
                    Button("Sort by Title") {
                        movieViewModel.sortByTitle()
                    }

                    Button("Sort by Year") {
                        movieViewModel.sortByYear()
                    }

                } label: {
                    Image(systemName: "arrow.up.arrow.down")
                }

                Button {
                    showFavoritesOnly.toggle()
                } label: {
                    Image(systemName: showFavoritesOnly ? "heart.fill" : "heart")
                        .foregroundColor(.red)
                }
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
