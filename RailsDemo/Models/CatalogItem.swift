//
//  CatalogItem.swift
//  RailsDemo
//
//  Created by Jeremiah Hawks on 12/15/25.
//

import Foundation

struct CatalogItem: Identifiable, Codable, Hashable {
    let id: String
    let kind: CatalogKind
    let title: String
    let subtitle: String?
    let description: String
    let imageName: String
}

