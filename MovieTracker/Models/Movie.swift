//
//  Movie.swift
//  MovieTracker
//
//  Created by Raid on 2026-03-11.
//

import Foundation

// Modèle représentant un film dans l'application
import Foundation

// Modèle représentant un film
struct Movie: Identifiable {

    // Identifiant unique
    let id = UUID()

    // Titre du film
    let title: String

    // Genre du film
    let genre: String

    // Année de sortie
    let year: Int

    // Description du film
    let description: String

    // Nom de l'image dans Assets
    let imageName: String

    // Indique si le film est favori
    var isFavorite: Bool
}
