#!/bin/bash
# Data import script for RailsDemo
# Downloads SWAPI data and saves first 5 results to Resources/ directory

RESOURCES_DIR="RailsDemo/Resources"
mkdir -p "$RESOURCES_DIR"

echo "Fetching SWAPI data..."

# Fetch films
echo "Fetching films..."
curl -s "https://swapi.dev/api/films/" | python3 -c "
import json, sys
data = json.load(sys.stdin)
if 'results' in data:
    data['results'] = data['results'][:5]
json.dump(data, sys.stdout, indent=2)
" > "$RESOURCES_DIR/films.json"
echo "  ✓ Saved films.json"

# Fetch people
echo "Fetching people..."
curl -s "https://swapi.dev/api/people/" | python3 -c "
import json, sys
data = json.load(sys.stdin)
if 'results' in data:
    data['results'] = data['results'][:5]
json.dump(data, sys.stdout, indent=2)
" > "$RESOURCES_DIR/people.json"
echo "  ✓ Saved people.json"

# Fetch starships
echo "Fetching starships..."
curl -s "https://swapi.dev/api/starships/" | python3 -c "
import json, sys
data = json.load(sys.stdin)
if 'results' in data:
    data['results'] = data['results'][:5]
json.dump(data, sys.stdout, indent=2)
" > "$RESOURCES_DIR/starships.json"
echo "  ✓ Saved starships.json"

echo ""
echo "✓ Data import complete!"

