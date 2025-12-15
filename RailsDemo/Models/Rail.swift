//
//  Rail.swift
//  RailsDemo
//
//  Created by Jeremiah Hawks on 12/15/25.
//

import Foundation

struct Rail: Identifiable, Hashable {
    let id: String
    let title: String
    let items: [CatalogItem]
}

