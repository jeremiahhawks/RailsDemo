//
//  ImageNameMapperTests.swift
//  RailsDemoTests
//
//  Created by Jeremiah Hawks on 12/15/25.
//

import Testing
@testable import RailsDemo

struct ImageNameMapperTests {

    @Test func testKnownFilmTitle() throws {
        let imageName = ImageNameMapper.imageName(for: .film, title: "A New Hope")
        #expect(imageName == "a_new_hope", "Should sanitize 'A New Hope' to 'a_new_hope'")
    }

    @Test func testKnownPersonName() throws {
        let imageName = ImageNameMapper.imageName(for: .person, title: "Luke Skywalker")
        #expect(imageName == "luke_skywalker", "Should sanitize 'Luke Skywalker' to 'luke_skywalker'")
    }

    @Test func testKnownStarshipName() throws {
        let imageName = ImageNameMapper.imageName(for: .starship, title: "Millennium Falcon")
        #expect(imageName == "millennium_falcon", "Should sanitize 'Millennium Falcon' to 'millennium_falcon'")
    }

    @Test func testTitleWithSpecialCharacters() throws {
        let imageName = ImageNameMapper.imageName(for: .film, title: "The Empire Strikes Back!")
        #expect(imageName == "the_empire_strikes_back", "Should remove special characters")
    }

    @Test func testTitleWithHyphen() throws {
        let imageName = ImageNameMapper.imageName(for: .person, title: "C-3PO")
        #expect(imageName == "c_3po", "Should handle hyphens and convert to underscores")
    }

    @Test func testTitleWithMultipleSpaces() throws {
        let imageName = ImageNameMapper.imageName(for: .starship, title: "Star  Destroyer")
        #expect(imageName == "star_destroyer", "Should collapse multiple spaces into single underscore")
    }

    @Test func testTitleWithNumbers() throws {
        let imageName = ImageNameMapper.imageName(for: .starship, title: "CR90 corvette")
        #expect(imageName == "cr90_corvette", "Should preserve numbers")
    }

    @Test func testUnknownTitle() throws {
        let imageName = ImageNameMapper.imageName(for: .film, title: "Some Unknown Film Title")
        #expect(!imageName.isEmpty, "Should return a non-empty string")
        #expect(imageName == "some_unknown_film_title", "Should sanitize unknown titles")
    }

    @Test func testEmptyTitle() throws {
        let imageName = ImageNameMapper.imageName(for: .film, title: "")
        #expect(imageName == "placeholder", "Should return 'placeholder' for empty title")
    }

    @Test func testTitleWithOnlySpecialCharacters() throws {
        let imageName = ImageNameMapper.imageName(for: .person, title: "!!!@@@###")
        #expect(imageName == "placeholder", "Should return 'placeholder' for title with only special characters")
    }

    @Test func testTitleWithConsecutiveUnderscores() throws {
        // Test that multiple consecutive special characters become single underscore
        let imageName = ImageNameMapper.imageName(for: .starship, title: "Star---Destroyer")
        #expect(!imageName.contains("__"), "Should collapse consecutive underscores")
        #expect(imageName == "star_destroyer", "Should result in single underscores")
    }

    @Test func testTitleWithLeadingTrailingUnderscores() throws {
        let imageName = ImageNameMapper.imageName(for: .film, title: " Test Film ")
        #expect(!imageName.hasPrefix("_"), "Should remove leading underscores")
        #expect(!imageName.hasSuffix("_"), "Should remove trailing underscores")
    }

    @Test func testCaseInsensitive() throws {
        let lowerCase = ImageNameMapper.imageName(for: .person, title: "luke skywalker")
        let upperCase = ImageNameMapper.imageName(for: .person, title: "LUKE SKYWALKER")
        let mixedCase = ImageNameMapper.imageName(for: .person, title: "Luke Skywalker")

        #expect(lowerCase == upperCase, "Should be case insensitive")
        #expect(upperCase == mixedCase, "Should be case insensitive")
    }
}

