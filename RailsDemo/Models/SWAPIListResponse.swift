//
//  SWAPIListResponse.swift
//  RailsDemo
//
//  Created by Jeremiah Hawks on 12/15/25.
//

import Foundation

struct SWAPIListResponse<T: Decodable>: Decodable {
    let results: [T]
}

