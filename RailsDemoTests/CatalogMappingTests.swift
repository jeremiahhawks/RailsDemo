//
//  CatalogMappingTests.swift
//  RailsDemoTests
//
//  Created by Jeremiah Hawks on 12/15/25.
//

import Testing
@testable import RailsDemo

struct CatalogMappingTests {

    @Test func testFilmToCatalogItem() throws {
        let film = SWAPIFilm(
            title: "A New Hope",
            opening_crawl: "It is a period of civil war...",
            director: "George Lucas",
            release_date: "1977-05-25",
            url: "https://swapi.dev/api/films/1/"
        )

        let catalogItem = CatalogItem(
            id: "1",
            kind: .film,
            title: film.title,
            subtitle: "Directed by \(film.director)",
            description: film.opening_crawl,
            imageName: ImageNameMapper.imageName(for: .film, title: film.title)
        )

        #expect(catalogItem.id == "1")
        #expect(catalogItem.kind == .film)
        #expect(catalogItem.title == "A New Hope")
        #expect(catalogItem.subtitle == "Directed by George Lucas")
        #expect(catalogItem.description == film.opening_crawl)
        #expect(catalogItem.imageName == "a_new_hope")
    }

    @Test func testPersonToCatalogItem() throws {
        let person = SWAPIPerson(
            name: "Luke Skywalker",
            birth_year: "19BBY",
            gender: "male",
            url: "https://swapi.dev/api/people/1/"
        )

        let catalogItem = CatalogItem(
            id: "1",
            kind: .person,
            title: person.name,
            subtitle: "Born: \(person.birth_year), \(person.gender)",
            description: "Character from the Star Wars universe.",
            imageName: ImageNameMapper.imageName(for: .person, title: person.name)
        )

        #expect(catalogItem.id == "1")
        #expect(catalogItem.kind == .person)
        #expect(catalogItem.title == "Luke Skywalker")
        #expect(catalogItem.subtitle == "Born: 19BBY, male")
        #expect(catalogItem.imageName == "luke_skywalker")
    }

    @Test func testStarshipToCatalogItem() throws {
        let starship = SWAPIStarship(
            name: "Millennium Falcon",
            model: "YT-1300 light freighter",
            manufacturer: "Corellian Engineering Corporation",
            url: "https://swapi.dev/api/starships/10/"
        )

        let catalogItem = CatalogItem(
            id: "10",
            kind: .starship,
            title: starship.name,
            subtitle: starship.model,
            description: "Manufactured by \(starship.manufacturer).",
            imageName: ImageNameMapper.imageName(for: .starship, title: starship.name)
        )

        #expect(catalogItem.id == "10")
        #expect(catalogItem.kind == .starship)
        #expect(catalogItem.title == "Millennium Falcon")
        #expect(catalogItem.subtitle == "YT-1300 light freighter")
        #expect(catalogItem.description == "Manufactured by Corellian Engineering Corporation.")
        #expect(catalogItem.imageName == "millennium_falcon")
    }

    @Test func testExtractIdFromURL() throws {
        // Test ID extraction logic - URLs should extract the last component as ID
        let testURLs = [
            ("https://swapi.dev/api/films/42/", "42"),
            ("https://swapi.dev/api/people/1/", "1"),
            ("https://swapi.dev/api/starships/10/", "10"),
            ("https://swapi.dev/api/films/999/", "999")
        ]

        for (url, expectedId) in testURLs {
            let components = url.split(separator: "/")
            let extractedId = String(components.last ?? "")
            #expect(extractedId == expectedId, "Should extract '\(expectedId)' from URL '\(url)'")
        }
    }
}

