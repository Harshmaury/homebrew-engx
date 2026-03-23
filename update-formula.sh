#!/usr/bin/env bash
# Run after goreleaser publishes a new release to update checksums.
# Usage: ./update-formula.sh v1.0.1
set -euo pipefail
TAG="${1:?Usage: $0 <tag>}"
VERSION="${TAG#v}"

echo "Fetching checksums for $TAG..."
CHECKSUMS_URL="https://github.com/Harshmaury/Nexus/releases/download/${TAG}/engx-${VERSION}-checksums.txt"
CHECKSUMS=$(curl -fsSL "$CHECKSUMS_URL")

darwin_sha=$(echo "$CHECKSUMS" | grep "darwin-amd64.tar.gz" | awk '{print $1}')
linux_sha=$(echo "$CHECKSUMS" | grep "linux-amd64.tar.gz" | awk '{print $1}')

echo "  darwin/amd64: $darwin_sha"
echo "  linux/amd64:  $linux_sha"

sed -i "s|version \".*\"|version \"${VERSION}\"|g" Formula/engx.rb
sed -i "s|/v[0-9][^/]*/engx-[^/]*-darwin|/${TAG}/engx-${VERSION}-darwin|g" Formula/engx.rb
sed -i "s|/v[0-9][^/]*/engx-[^/]*-linux|/${TAG}/engx-${VERSION}-linux|g" Formula/engx.rb
sed -i "s|sha256 :no_check.*darwin.*|sha256 \"${darwin_sha}\" # darwin-amd64|g" Formula/engx.rb
sed -i "s|sha256 :no_check.*linux.*|sha256 \"${linux_sha}\" # linux-amd64|g" Formula/engx.rb

git add Formula/engx.rb
git commit -m "formula: bump to ${VERSION}"
git push
echo "✓ Formula updated and pushed"
