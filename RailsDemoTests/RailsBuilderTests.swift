//
//  RailsBuilderTests.swift
//  RailsDemoTests
//
//  Created by Jeremiah Hawks on 12/15/25.
//

import Testing
@testable import RailsDemo

struct RailsBuilderTests {

    @Test func testRailsBuilderCreatesThreeRails() async throws {
        await MainActor.run {
            let viewModel = CatalogViewModel()
            #expect(viewModel.rails.count == 3, "Should create exactly 3 rails")
        }
    }

    @Test func testFilmsRailHasFiveItems() async throws {
        await MainActor.run {
            let viewModel = CatalogViewModel()
            let filmsRail = viewModel.rails.first { $0.id == "films" }
            #expect(filmsRail != nil, "Should have a films rail")
            #expect(filmsRail?.title == "Films", "Films rail should have correct title")
            #expect(filmsRail?.items.count == 5, "Films rail should have exactly 5 items")
        }
    }

    @Test func testPeopleRailHasFiveItems() async throws {
        await MainActor.run {
            let viewModel = CatalogViewModel()
            let peopleRail = viewModel.rails.first { $0.id == "people" }
            #expect(peopleRail != nil, "Should have a people rail")
            #expect(peopleRail?.title == "Characters", "People rail should have correct title")
            #expect(peopleRail?.items.count == 5, "People rail should have exactly 5 items")
        }
    }

    @Test func testStarshipsRailHasFiveItems() async throws {
        await MainActor.run {
            let viewModel = CatalogViewModel()
            let starshipsRail = viewModel.rails.first { $0.id == "starships" }
            #expect(starshipsRail != nil, "Should have a starships rail")
            #expect(starshipsRail?.title == "Starships", "Starships rail should have correct title")
            #expect(starshipsRail?.items.count == 5, "Starships rail should have exactly 5 items")
        }
    }

    @Test func testAllRailsHaveCorrectIds() async throws {
        await MainActor.run {
            let viewModel = CatalogViewModel()
            let railIds = Set(viewModel.rails.map { $0.id })
            #expect(railIds.contains("films"), "Should have films rail")
            #expect(railIds.contains("people"), "Should have people rail")
            #expect(railIds.contains("starships"), "Should have starships rail")
        }
    }

    @Test func testAllItemsHaveValidProperties() async throws {
        await MainActor.run {
            let viewModel = CatalogViewModel()
            for rail in viewModel.rails {
                for item in rail.items {
                    #expect(!item.id.isEmpty, "Item should have non-empty ID")
                    #expect(!item.title.isEmpty, "Item should have non-empty title")
                    #expect(!item.description.isEmpty, "Item should have non-empty description")
                    #expect(!item.imageName.isEmpty, "Item should have non-empty imageName")
                }
            }
        }
    }
}

