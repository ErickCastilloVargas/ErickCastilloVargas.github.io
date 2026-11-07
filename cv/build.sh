#!/usr/bin/env bash
# Builds the CV PDF from cv.md.
# Usage: cv/build.sh [output.pdf]   (default: assets/files/cv.pdf)
# Requires: pandoc, weasyprint
set -euo pipefail

cv_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
out="${1:-$cv_dir/../assets/files/cv.pdf}"
html="$(mktemp "$cv_dir/.cv.XXXXXX.html")"
trap 'rm -f "$html"' EXIT

pandoc "$cv_dir/cv.md" \
  --from markdown+hard_line_breaks \
  --to html5 \
  --template "$cv_dir/template.html" \
  --output "$html"

weasyprint --base-url "$cv_dir/" "$html" "$out"
echo "CV written to $out"
