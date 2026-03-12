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
    @StateObject private var viewModel = MovieViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                // Boucle sur tous les films
                ForEach(viewModel.movies) { movie in
                    
                    NavigationLink(destination: MovieDetailView(movie: movie)) {
                        MovieRowView(movie: movie)
                    }
                    // Rend toute la ligne interactive
                    .contentShape(Rectangle())
                    // Double tap pour ajouter ou retirer un favori
                    .simultaneousGesture(
                        TapGesture(count: 2)
                            .onEnded {
                                viewModel.toggleFavorite(for: movie)
                            }
                    )
                    // Menu affiché avec un appui long
                    .contextMenu {
                        Button {
                            viewModel.toggleFavorite(for: movie)
                        } label: {
                            Label(
                                movie.isFavorite ? "Retirer des favoris" : "Ajouter aux favoris",
                                systemImage: movie.isFavorite ? "star.slash" : "star"
                            )
                        }
                    }
                }
                // Suppression par swipe
                .onDelete(perform: viewModel.deleteMovie)
            }
            .navigationTitle("Mes films")
            .toolbar {
                EditButton()
            }
        }
    }
}

// Preview SwiftUI
struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
