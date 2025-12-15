//
//  CatalogViewModel.swift
//  RailsDemo
//
//  Created by Jeremiah Hawks on 12/15/25.
//

import Foundation

@MainActor
class CatalogViewModel: ObservableObject {
    @Published var rails: [Rail] = []

    init() {
        loadData()
    }

    func loadData() {
        var loadedRails: [Rail] = []

        // Load Films
        if let filmResponse: SWAPIListResponse<SWAPIFilm> = BundleJSONLoader.load(filename: "films") {
            let films = Array(filmResponse.results.prefix(5))
            let catalogItems = films.map { film in
                CatalogItem(
                    id: extractId(from: film.url),
                    kind: .film,
                    title: film.title,
                    subtitle: "Directed by \(film.director)",
                    description: film.opening_crawl,
                    imageName: ImageNameMapper.imageName(for: .film, title: film.title)
                )
            }
            loadedRails.append(Rail(id: "films", title: "Films", items: catalogItems))
        }

        // Load People
        if let peopleResponse: SWAPIListResponse<SWAPIPerson> = BundleJSONLoader.load(filename: "people") {
            let people = Array(peopleResponse.results.prefix(5))
            let catalogItems = people.map { person in
                CatalogItem(
                    id: extractId(from: person.url),
                    kind: .person,
                    title: person.name,
                    subtitle: "Born: \(person.birth_year), \(person.gender)",
                    description: "Character from the Star Wars universe.",
                    imageName: ImageNameMapper.imageName(for: .person, title: person.name)
                )
            }
            loadedRails.append(Rail(id: "people", title: "Characters", items: catalogItems))
        }

        // Load Starships
        if let starshipsResponse: SWAPIListResponse<SWAPIStarship> = BundleJSONLoader.load(filename: "starships") {
            let starships = Array(starshipsResponse.results.prefix(5))
            let catalogItems = starships.map { starship in
                CatalogItem(
                    id: extractId(from: starship.url),
                    kind: .starship,
                    title: starship.name,
                    subtitle: starship.model,
                    description: "Manufactured by \(starship.manufacturer).",
                    imageName: ImageNameMapper.imageName(for: .starship, title: starship.name)
                )
            }
            loadedRails.append(Rail(id: "starships", title: "Starships", items: catalogItems))
        }

        rails = loadedRails
    }

    private func extractId(from url: String) -> String {
        // Extract ID from SWAPI URL like "https://swapi.dev/api/films/1/"
        let components = url.split(separator: "/")
        return String(components.last ?? "")
    }
}

