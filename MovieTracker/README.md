# MovieTracker

MovieTracker is an iOS application built with **SwiftUI** that allows users to browse a list of movies, view details, mark favorites, and search through the collection.

## Features

- Movie list with posters
- Movie detail screen
- Mark / unmark favorite movies
- Search movies by title
- Sort movies (by title or year)
- Filter favorites
- Delete movies with swipe gesture
- Context menu with long press

## Architecture

The application follows the **MVVM (Model – View – ViewModel)** architecture.

### Model
- `Movie.swift`
Represents a movie with its properties.

### ViewModel
- `MovieViewModel.swift`
Handles movie data, sorting, favorites and updates the UI.

### Views
- `MovieListView.swift` – Displays the list of movies
- `MovieRowView.swift` – Represents a single movie row
- `MovieDetailView.swift` – Displays movie details

## Technologies

- Swift
- SwiftUI
- MVVM Architecture
- Xcode

## Interactions

- Tap a movie → open movie details
- Tap heart icon → add/remove favorite
- Swipe left → delete movie
- Long press → context menu actions
- Search bar → filter movies

## Screens

Movie list displays posters, title, genre and year.

## Author

Raid Mohammed
