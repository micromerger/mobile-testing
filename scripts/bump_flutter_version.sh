#!/bin/bash
set -euo pipefail

VERSION=$1
# Use total git commit count as build number
BUILD=$(git rev-list --count HEAD)

echo "Bumping version to $VERSION+$BUILD"

# Update pubspec.yaml
sed -i -E "s/^version:.*/version: $VERSION+$BUILD/" pubspec.yaml

echo "Updated pubspec.yaml:"
grep "^version:" pubspec.yaml
