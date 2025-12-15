//
//  PosterCardView.swift
//  RailsDemo
//
//  Created by Jeremiah Hawks on 12/15/25.
//

import SwiftUI

struct PosterCardView: View {
    let item: CatalogItem

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Image
            AsyncImageAsset(name: item.imageName)
                .frame(width: 120, height: 180)
                .clipped()
                .cornerRadius(8)

            // Title
            Text(item.title)
                .font(.caption)
                .fontWeight(.semibold)
                .lineLimit(2)
                .frame(width: 120, alignment: .leading)
        }
        .frame(width: 120)
        .contentShape(Rectangle())
    }
}

#Preview {
    PosterCardView(
        item: CatalogItem(
            id: "1",
            kind: .film,
            title: "A New Hope",
            subtitle: "Directed by George Lucas",
            description: "It is a period of civil war...",
            imageName: "placeholder"
        )
    )
}

