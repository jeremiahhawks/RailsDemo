//
//  AsyncImageAsset.swift
//  RailsDemo
//
//  Created by Jeremiah Hawks on 12/15/25.
//

import SwiftUI

struct AsyncImageAsset: View {
    let name: String
    let contentMode: ContentMode

    init(name: String, contentMode: ContentMode = .fill) {
        self.name = name
        self.contentMode = contentMode
    }

    var body: some View {
        Group {
            if let image = UIImage(named: name) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: contentMode)
            } else {
                // Fallback to system image if asset not found
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.gray)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.gray.opacity(0.2))
            }
        }
    }
}

#Preview {
    VStack {
        AsyncImageAsset(name: "placeholder")
            .frame(width: 120, height: 180)
            .clipped()
            .cornerRadius(8)

        AsyncImageAsset(name: "nonexistent")
            .frame(width: 120, height: 180)
            .clipped()
            .cornerRadius(8)
    }
}

