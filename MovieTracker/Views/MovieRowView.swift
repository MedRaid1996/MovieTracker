//
//  MovieRowView.swift
//  MovieTracker
//
//  Created by Raid on 2026-03-11.
//

import Foundation
import SwiftUI

struct MovieRowView: View {

    var movie: Movie

    var body: some View {

        HStack {

            // Poster du film
            Image(movie.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 75)
                .cornerRadius(8)

            VStack(alignment: .leading) {

                // Titre du film
                Text(movie.title)
                    .font(.headline)

                // Genre et année
                Text("\(movie.genre) • \(movie.year)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()

            // Icône favori
            Image(systemName: movie.isFavorite ? "heart.fill" : "heart")
                .foregroundColor(.red)
        }
    }
}
