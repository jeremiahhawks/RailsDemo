//
//  ContentView.swift
//  RailsDemo
//
//  Created by Jeremiah Hawks on 12/15/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CatalogViewModel()

    var body: some View {
        TabView {
            // Home Tab
            NavigationStack {
                if viewModel.rails.isEmpty {
                    Text("Unable to load data")
                        .foregroundColor(.secondary)
                } else {
                    ScrollView {
                        VStack(spacing: 24) {
                            ForEach(viewModel.rails) { rail in
                                RailView(rail: rail)
                            }
                        }
                        .padding(.vertical)
                    }
                    .navigationTitle("Star Wars")
                    .navigationDestination(for: CatalogItem.self) { item in
                        DetailView(item: item)
                    }
                }
            }
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }

            // Profile Tab
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
    }
}

#Preview {
    ContentView()
}
