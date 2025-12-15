//
//  DetailView.swift
//  RailsDemo
//
//  Created by Jeremiah Hawks on 12/15/25.
//

import SwiftUI

struct DetailView: View {
    let item: CatalogItem

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Large Image
                AsyncImageAsset(name: item.imageName)
                    .frame(maxWidth: .infinity, maxHeight: 400)
                    .clipped()

                VStack(alignment: .leading, spacing: 12) {
                    // Title
                    Text(item.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    // Subtitle (if available)
                    if let subtitle = item.subtitle {
                        Text(subtitle)
                            .font(.title3)
                            .foregroundColor(.secondary)
                    }

                    Divider()

                    // Description
                    Text(item.description)
                        .font(.body)
                        .lineSpacing(4)
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        DetailView(
            item: CatalogItem(
                id: "1",
                kind: .film,
                title: "A New Hope",
                subtitle: "Directed by George Lucas",
                description: "It is a period of civil war. Rebel spaceships, striking from a hidden base, have won their first victory against the evil Galactic Empire.",
                imageName: "placeholder"
            )
        )
    }
}

