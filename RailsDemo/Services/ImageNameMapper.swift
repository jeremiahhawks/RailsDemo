//
//  ImageNameMapper.swift
//  RailsDemo
//
//  Created by Jeremiah Hawks on 12/15/25.
//

import Foundation

struct ImageNameMapper {
    /// Maps a title/name to a local asset name by sanitizing the input string
    /// Converts spaces and special characters to underscores, lowercase
    static func imageName(for kind: CatalogKind, title: String) -> String {
        return sanitizeAssetName(title)
    }

    /// Sanitizes a string to match our asset naming convention
    /// - Replaces spaces and special characters with underscores
    /// - Converts to lowercase
    /// - Removes multiple consecutive underscores
    private static func sanitizeAssetName(_ name: String) -> String {
        var sanitized = name.lowercased()
        // Replace any non-alphanumeric character with underscore
        sanitized = sanitized.replacingOccurrences(of: "[^a-z0-9]", with: "_", options: .regularExpression)
        // Remove multiple consecutive underscores
        while sanitized.contains("__") {
            sanitized = sanitized.replacingOccurrences(of: "__", with: "_")
        }
        // Remove leading/trailing underscores
        sanitized = sanitized.trimmingCharacters(in: CharacterSet(charactersIn: "_"))
        return sanitized.isEmpty ? "placeholder" : sanitized
    }
}

