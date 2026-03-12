//
//  MovieViewModel.swift
//  MovieTracker
//
//  Created by Raid on 2026-03-11.
//

import Foundation

// ViewModel responsable de gérer les données des films
class MovieViewModel: ObservableObject {
    
    // Liste observable des films affichés dans l'application
    @Published var movies: [Movie] = [
        
        Movie(title: "Inception", genre: "Science-fiction", year: 2010,
              description: "Un voleur infiltre les rêves pour voler des secrets.", isFavorite: false),
        
        Movie(title: "Interstellar", genre: "Aventure", year: 2014,
              description: "Une mission spatiale pour sauver l'humanité.", isFavorite: false),
        
        Movie(title: "The Dark Knight", genre: "Action", year: 2008,
              description: "Batman affronte le Joker à Gotham.", isFavorite: false),
        
        Movie(title: "Avatar", genre: "Science-fiction", year: 2009,
              description: "Un soldat découvre un monde extraterrestre.", isFavorite: false),
        
        Movie(title: "Titanic", genre: "Romance", year: 1997,
              description: "Une histoire d'amour pendant le naufrage du Titanic.", isFavorite: false),
        
        Movie(title: "The Matrix", genre: "Science-fiction", year: 1999,
              description: "Un hacker découvre la réalité simulée.", isFavorite: false),
        
        Movie(title: "Gladiator", genre: "Historique", year: 2000,
              description: "Un général romain devient gladiateur.", isFavorite: false),
        
        Movie(title: "Jurassic Park", genre: "Aventure", year: 1993,
              description: "Un parc de dinosaures devient incontrôlable.", isFavorite: false),
        
        Movie(title: "The Avengers", genre: "Super-héros", year: 2012,
              description: "Les héros Marvel unissent leurs forces.", isFavorite: false),
        
        Movie(title: "Spider-Man", genre: "Super-héros", year: 2002,
              description: "Un étudiant obtient des pouvoirs d'araignée.", isFavorite: false),
        
        Movie(title: "Iron Man", genre: "Action", year: 2008,
              description: "Un milliardaire construit une armure technologique.", isFavorite: false),
        
        Movie(title: "Frozen", genre: "Animation", year: 2013,
              description: "Une princesse contrôle la glace.", isFavorite: false),
        
        Movie(title: "Toy Story", genre: "Animation", year: 1995,
              description: "Les jouets prennent vie quand les humains partent.", isFavorite: false),
        
        Movie(title: "Harry Potter", genre: "Fantaisie", year: 2001,
              description: "Un jeune sorcier découvre ses pouvoirs.", isFavorite: false),
        
        Movie(title: "The Lord of the Rings", genre: "Fantaisie", year: 2001,
              description: "Une quête pour détruire un anneau puissant.", isFavorite: false)
    ]
    
    // Supprimer un film de la liste
    func deleteMovie(at offsets: IndexSet) {
        movies.remove(atOffsets: offsets)
    }
    
    // Ajouter ou retirer un film des favoris
    func toggleFavorite(for movie: Movie) {
        if let index = movies.firstIndex(where: { $0.id == movie.id }) {
            movies[index].isFavorite.toggle()
        }
    }
}
