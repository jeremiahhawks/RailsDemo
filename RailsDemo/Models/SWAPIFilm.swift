//
//  SWAPIFilm.swift
//  RailsDemo
//
//  Created by Jeremiah Hawks on 12/15/25.
//

import Foundation

struct SWAPIFilm: Decodable {
    let title: String
    let opening_crawl: String
    let director: String
    let release_date: String
    let url: String
}

