//
//  Movie.swift
//  MovieTracker
//
//  Created by Raid on 2026-03-11.
//

import Foundation

// Modèle représentant un film dans l'application
struct Movie: Identifiable {
    
    // Identifiant unique utilisé par SwiftUI dans les listes
    let id = UUID()
    
    // Titre du film
    let title: String
    
    // Genre du film (Action, Sci-Fi, etc.)
    let genre: String
    
    // Année de sortie du film
    let year: Int
    
    // Description du film
    let description: String
    
    // Indique si le film est dans les favoris
    var isFavorite: Bool
}
