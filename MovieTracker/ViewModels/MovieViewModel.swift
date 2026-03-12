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
        
        Movie(
            title: "Inception",
            genre: "Science-fiction",
            year: 2010,
            description: "Un voleur infiltre les rêves pour voler des secrets.",
            imageName: "inception",
            isFavorite: false
        ),
        
        Movie(
            title: "Interstellar",
            genre: "Aventure",
            year: 2014,
            description: "Une équipe voyage dans l'espace pour sauver l'humanité.",
            imageName: "interstellar",
            isFavorite: false
        ),
        
        Movie(
            title: "The Dark Knight",
            genre: "Action",
            year: 2008,
            description: "Batman affronte le Joker à Gotham.",
            imageName: "darkknight",
            isFavorite: false
        ),
        
        Movie(
            title: "Avatar",
            genre: "Science-fiction",
            year: 2009,
            description: "Un soldat découvre un monde extraterrestre fascinant.",
            imageName: "avatar",
            isFavorite: false
        ),
        
        Movie(
            title: "Titanic",
            genre: "Romance",
            year: 1997,
            description: "Une histoire d'amour naît à bord du Titanic.",
            imageName: "titanic",
            isFavorite: false
        ),
        
        Movie(
            title: "The Matrix",
            genre: "Science-fiction",
            year: 1999,
            description: "Un hacker découvre que le monde est une simulation.",
            imageName: "matrix",
            isFavorite: false
        ),
        
        Movie(
            title: "Gladiator",
            genre: "Historique",
            year: 2000,
            description: "Un général romain trahi devient gladiateur.",
            imageName: "gladiator",
            isFavorite: false
        ),
        
        Movie(
            title: "Jurassic Park",
            genre: "Aventure",
            year: 1993,
            description: "Des dinosaures clonés s'échappent dans un parc.",
            imageName: "jurassicpark",
            isFavorite: false
        ),
        
        Movie(
            title: "The Avengers",
            genre: "Super-héros",
            year: 2012,
            description: "Les héros Marvel s'unissent pour sauver la Terre.",
            imageName: "avengers",
            isFavorite: false
        ),
        
        Movie(
            title: "Spider-Man",
            genre: "Super-héros",
            year: 2002,
            description: "Un étudiant développe des pouvoirs d'araignée.",
            imageName: "spiderman",
            isFavorite: false
        ),
        
        Movie(
            title: "Iron Man",
            genre: "Action",
            year: 2008,
            description: "Tony Stark crée une armure de haute technologie.",
            imageName: "ironman",
            isFavorite: false
        ),
        
        Movie(
            title: "Frozen",
            genre: "Animation",
            year: 2013,
            description: "Une princesse possède le pouvoir de contrôler la glace.",
            imageName: "frozen",
            isFavorite: false
        ),
        
        Movie(
            title: "Toy Story",
            genre: "Animation",
            year: 1995,
            description: "Les jouets prennent vie quand les humains s'absentent.",
            imageName: "toystory",
            isFavorite: false
        ),
        
        Movie(
            title: "Harry Potter",
            genre: "Fantaisie",
            year: 2001,
            description: "Un jeune sorcier entre dans le monde de la magie.",
            imageName: "harrypotter",
            isFavorite: false
        ),
        
        Movie(
            title: "The Lord of the Rings",
            genre: "Fantaisie",
            year: 2001,
            description: "Une quête périlleuse commence pour détruire l'anneau unique.",
            imageName: "lotr",
            isFavorite: false
        )
    ]
    
    // Supprimer un film de la liste
    func deleteMovie(at offsets: IndexSet) {
        movies.remove(atOffsets: offsets)
    }
    
    // Change l'état favori d'un film
    func toggleFavorite(_ movie: Movie) {
        if let index = movies.firstIndex(where: { $0.id == movie.id }) {
            movies[index].isFavorite.toggle()
        }
    }
}
