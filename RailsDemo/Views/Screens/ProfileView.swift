//
//  ProfileView.swift
//  RailsDemo
//
//  Created by Jeremiah Hawks on 12/15/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 28) {
                    // Header Section
                    VStack(spacing: 12) {
                        AsyncImageAsset(name: "profile_image")
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.gray.opacity(0.3), lineWidth: 2))

                        Text("Jeremiah Hawks")
                            .font(.title)
                            .fontWeight(.bold)

                        Text("Senior Mobile Engineer · SwiftUI · Demo-First Builds")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)

                        Text("Investor demos · Streaming UIs · Rapid iteration")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.top, 20)

                    Divider()
                        .padding(.horizontal)

                    // Why I built this demo
                    ProfileSection(title: "Why I built this demo") {
                        Text("This SwiftUI app was built as a demo-first project to mirror the needs of an investor-facing streaming companion app.\n\nThe focus is speed, clarity, and predictable execution — using local JSON bundles, reusable components, and clean navigation to support rapid iteration.")
                            .font(.body)
                            .foregroundColor(.primary)
                    }

                    // What this demo demonstrates
                    ProfileSection(title: "What this demo demonstrates") {
                        VStack(alignment: .leading, spacing: 8) {
                            BulletPoint("SwiftUI + MVVM architecture")
                            BulletPoint("Home rails with reusable poster components")
                            BulletPoint("Detail page navigation using NavigationStack")
                            BulletPoint("Local JSON \"Demo Mode\" data loading")
                            BulletPoint("Clean design tokens (spacing, typography)")
                            BulletPoint("Built for iteration, not production overhead")
                        }
                    }

                    // Navigation approach
                    ProfileSection(title: "Navigation approach") {
                        Text("I prefer SwiftUI's NavigationStack with value-based navigation for demo and early-stage apps.\n\nIt keeps state predictable, avoids unnecessary coordinator complexity, and scales cleanly as features are added.")
                            .font(.body)
                            .foregroundColor(.primary)
                    }

                    // Relevant experience
                    ProfileSection(title: "Relevant experience") {
                        VStack(alignment: .leading, spacing: 8) {
                            BulletPoint("7+ years iOS development (UIKit → SwiftUI)")
                            BulletPoint("Built and shipped consumer-facing mobile apps")
                            BulletPoint("Experience with rails-style UIs and media catalogs")
                            BulletPoint("Recent work across SwiftUI, Flutter, and Python automation")
                            BulletPoint("Comfortable shipping quickly with AI-assisted workflows")
                        }
                    }

                    // How I work
                    ProfileSection(title: "How I work") {
                        VStack(alignment: .leading, spacing: 8) {
                            BulletPoint("Async-first, remote-friendly")
                            BulletPoint("Clear ownership of features")
                            BulletPoint("Short-lived feature branches")
                            BulletPoint("Weekly Loom demos and written updates")
                            BulletPoint("Pragmatic about scope and tradeoffs")
                        }
                    }

                    // Languages
                    ProfileSection(title: "Languages") {
                        VStack(alignment: .leading, spacing: 8) {
                            BulletPoint("English — native")
                            BulletPoint("Spanish — fluent (professional / conversational)")
                        }
                    }

                    // Availability
                    ProfileSection(title: "Availability") {
                        Text("Available 40 hrs/week · Jan–Mar\n\nOpen to demo-first engagements with option to extend")
                            .font(.body)
                            .foregroundColor(.primary)
                    }

                    // Rate
                    ProfileSection(title: "Rate") {
                        Text("Typical rate: $50–55/hr (flexible for short demo engagements)")
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("Profile")
        }
    }
}

struct ProfileSection<Content: View>: View {
    let title: String
    let content: Content

    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.headline)
                .padding(.horizontal)

            content
                .padding(.horizontal)
        }
    }
}

struct BulletPoint: View {
    let text: String

    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Text("•")
                .foregroundColor(.blue)

            Text(text)
                .font(.body)
                .foregroundColor(.primary)

            Spacer()
        }
    }
}

#Preview {
    ProfileView()
}

