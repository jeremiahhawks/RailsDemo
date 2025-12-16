//
//  BundleJSONLoaderTests.swift
//  RailsDemoTests
//
//  Created by Jeremiah Hawks on 12/15/25.
//

import Testing
@testable import RailsDemo

struct BundleJSONLoaderTests {

    @Test func testDecodeFilmsJSON() throws {
        let result: SWAPIListResponse<SWAPIFilm>? = BundleJSONLoader.load(filename: "films")
        #expect(result != nil, "Should successfully decode films.json")
        #expect(result?.results.count ?? 0 > 0, "Should have at least one film")

        if let firstFilm = result?.results.first {
            #expect(!firstFilm.title.isEmpty, "Film should have a title")
            #expect(!firstFilm.director.isEmpty, "Film should have a director")
            #expect(!firstFilm.url.isEmpty, "Film should have a URL")
        }
    }

    @Test func testDecodePeopleJSON() throws {
        let result: SWAPIListResponse<SWAPIPerson>? = BundleJSONLoader.load(filename: "people")
        #expect(result != nil, "Should successfully decode people.json")
        #expect(result?.results.count ?? 0 > 0, "Should have at least one person")

        if let firstPerson = result?.results.first {
            #expect(!firstPerson.name.isEmpty, "Person should have a name")
            #expect(!firstPerson.url.isEmpty, "Person should have a URL")
        }
    }

    @Test func testDecodeStarshipsJSON() throws {
        let result: SWAPIListResponse<SWAPIStarship>? = BundleJSONLoader.load(filename: "starships")
        #expect(result != nil, "Should successfully decode starships.json")
        #expect(result?.results.count ?? 0 > 0, "Should have at least one starship")

        if let firstStarship = result?.results.first {
            #expect(!firstStarship.name.isEmpty, "Starship should have a name")
            #expect(!firstStarship.model.isEmpty, "Starship should have a model")
            #expect(!firstStarship.url.isEmpty, "Starship should have a URL")
        }
    }

    @Test func testDecodeNonExistentFile() throws {
        let result: SWAPIListResponse<SWAPIFilm>? = BundleJSONLoader.load(filename: "nonexistent")
        #expect(result == nil, "Should return nil for non-existent file")
    }
}

