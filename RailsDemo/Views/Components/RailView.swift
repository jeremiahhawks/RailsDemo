//
//  RailView.swift
//  RailsDemo
//
//  Created by Jeremiah Hawks on 12/15/25.
//

import SwiftUI

struct RailView: View {
    let rail: Rail

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Rail Title
            Text(rail.title)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.horizontal)

            // Horizontal ScrollView of cards
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(rail.items) { item in
                        NavigationLink(value: item) {
                            PosterCardView(item: item)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .contentShape(Rectangle())
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    NavigationStack {
        RailView(
            rail: Rail(
                id: "films",
                title: "Films",
                items: [
                    CatalogItem(
                        id: "1",
                        kind: .film,
                        title: "A New Hope",
                        subtitle: "Directed by George Lucas",
                        description: "It is a period of civil war...",
                        imageName: "placeholder"
                    )
                ]
            )
        )
    }
}

