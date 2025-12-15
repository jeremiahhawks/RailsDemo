# RailsDemo

A demo-first SwiftUI app showcasing horizontal poster rails (streaming-style UI) with detail navigation — built to demonstrate clean architecture, reusable components, and rapid iteration patterns for investor-facing streaming companion apps.

## Overview

This project demonstrates core patterns needed for a streaming companion app:
- **Home rails** with horizontal scrolling poster cards
- **Detail pages** with full item information
- **Clean MVVM architecture** with SwiftUI
- **Local JSON "Demo Mode"** data loading
- **Reusable components** for rapid iteration

## Features

- ✅ Three horizontal rails (Films, Characters, Starships)
- ✅ Tap-to-navigate detail views
- ✅ Local bundle JSON data (no network calls)
- ✅ Reusable poster card components
- ✅ Clean navigation with NavigationStack
- ✅ Professional profile/resume page

## Architecture

### Structure
```
RailsDemo/
├── Models/           # Data models (CatalogItem, Rail, SWAPI models)
├── Services/         # Data loading & image mapping
├── ViewModels/       # ObservableObject view models (MVVM)
├── Views/
│   ├── Components/   # Reusable UI components
│   └── Screens/      # Screen-level views
└── Resources/        # Local JSON data files
```

### Key Patterns

- **MVVM**: ViewModels are `ObservableObject` classes that manage state
- **Navigation**: Uses `NavigationStack` with value-based navigation (`NavigationLink(value:)`)
- **Data Loading**: `BundleJSONLoader` service loads from local JSON files
- **Component Reusability**: `PosterCardView`, `RailView`, `AsyncImageAsset` are reusable

## Requirements

- iOS 18.5+
- Xcode 16.4+
- Swift 5.0+

## Setup

1. Clone the repository
2. Open `RailsDemo.xcodeproj` in Xcode
3. Build and run on simulator or device

### Data Files

The app uses local JSON files in `RailsDemo/Resources/`:
- `films.json` - First 5 films from SWAPI
- `people.json` - First 5 characters from SWAPI
- `starships.json` - First 5 starships from SWAPI

To regenerate data files, run:
```bash
python3 import_data.py
```

## Screenshots

_Add screenshots or screen recordings here showing:_
- Home screen with rails
- Detail view
- Profile page

## Technical Details

### Navigation Approach

Uses SwiftUI's `NavigationStack` with value-based navigation for predictable state management:

```swift
NavigationStack {
    // Content
}
.navigationDestination(for: CatalogItem.self) { item in
    DetailView(item: item)
}
```

This avoids coordinator/router complexity while maintaining clean, scalable navigation.

### Image Handling

Images are stored in `Assets.xcassets` with automatic name sanitization:
- JSON names (e.g., "A New Hope") → Asset names (e.g., "a_new_hope")
- Fallback to system image if asset not found
- Supports mixed aspect ratios with proper clipping

### Data Model

- `CatalogItem`: Unified UI model for all item types
- `Rail`: Container for grouped items
- SWAPI models: Decodable structs matching JSON structure
- `SWAPIListResponse<T>`: Generic wrapper for list responses

## Why This Demo

Built to mirror the needs of investor-facing streaming companion apps:
- **Speed**: Local data = instant loading
- **Clarity**: Clean architecture = easy to extend
- **Predictable**: No network dependencies = consistent demos

Perfect for demonstrating core streaming UI patterns (rails, posters, details) without production complexity.

## Built With

- SwiftUI
- Swift 5.0
- MVVM Architecture
- Local JSON Data Loading

## Author

**Jeremiah Hawks**
- Senior Mobile Engineer
- SwiftUI · Demo-First Builds
- Available for iOS development opportunities

## License

This project is a portfolio/demo piece. Code is provided as-is for demonstration purposes.

