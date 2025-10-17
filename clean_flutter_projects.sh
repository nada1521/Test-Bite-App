#!/bin/bash

# Script: chmod +x clean_flutter_projects.sh
#./clean_flutter_projects.sh

ROOT_DIR="./"

echo "🔍 Searching for Flutter projects in: $ROOT_DIR"
echo

# Find all folders containing a pubspec.yaml
find "$ROOT_DIR" -name "pubspec.yaml" | while read -r pubspec; do
  project_dir=$(dirname "$pubspec")
  echo "🧹 Cleaning project: $project_dir"
  (
    cd "$project_dir" || exit
    flutter clean
  )
  echo
done

echo "✅ All Flutter projects cleaned!"
