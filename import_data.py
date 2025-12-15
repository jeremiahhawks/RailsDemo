#!/usr/bin/env python3
"""
Data import script for RailsDemo
Downloads SWAPI data and saves first 5 results to Resources/ directory
"""

import json
import urllib.request
import os

# Create Resources directory if it doesn't exist
resources_dir = "RailsDemo/Resources"
os.makedirs(resources_dir, exist_ok=True)

# URLs to fetch
urls = {
    "films": "https://swapi.dev/api/films/",
    "people": "https://swapi.dev/api/people/",
    "starships": "https://swapi.dev/api/starships/"
}

def fetch_and_save(endpoint, filename):
    print(f"Fetching {endpoint}...")
    try:
        with urllib.request.urlopen(urls[endpoint]) as response:
            data = json.loads(response.read())

            # Take first 5 results
            if "results" in data and len(data["results"]) > 5:
                data["results"] = data["results"][:5]

            # Save to file
            filepath = os.path.join(resources_dir, f"{filename}.json")
            with open(filepath, "w") as f:
                json.dump(data, f, indent=2)

            count = len(data.get("results", []))
            print(f"  ✓ Saved {count} items to {filepath}")
    except Exception as e:
        print(f"  ✗ Error fetching {endpoint}: {e}")

# Fetch and save all endpoints
fetch_and_save("films", "films")
fetch_and_save("people", "people")
fetch_and_save("starships", "starships")

print("\n✓ Data import complete!")

