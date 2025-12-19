#!/usr/bin/env bash
# scripts/hash-all.sh
# Usage:
#   ./scripts/hash-all.sh             # hash tracked files only
#   ./scripts/hash-all.sh --include-untracked   # include untracked files
#   ./scripts/hash-all.sh [--include-untracked] <output-file>
set -euo pipefail

OUT=${2:-${1:-checksums.sha256}}
INCLUDE_UNTRACKED=0
# If the first arg is the flag, shift to allow optional second arg for filename
if [ "${1:-}" = "--include-untracked" ] || [ "${1:-}" = "-u" ]; then
  INCLUDE_UNTRACKED=1
  # allow optional second arg for output file name
  OUT=${2:-checksums.sha256}
fi

# Choose hashing command
if command -v sha256sum >/dev/null 2>&1; then
  HS_CMD="sha256sum --binary"
  HS_FALLBACK="sha256sum"
elif command -v shasum >/dev/null 2>&1; then
  HS_CMD="shasum -a 256"
  HS_FALLBACK=""
else
  echo "Error: sha256sum or shasum required in PATH" >&2
  exit 2
fi

# Build file list command
if [ "$INCLUDE_UNTRACKED" -eq 1 ]; then
  LIST_CMD="git ls-files -z --cached --others --exclude-standard"
else
  LIST_CMD="git ls-files -z"
fi

tmpfile=$(mktemp)
# Generate per-file hashes deterministically (sorted) and write to tmp
eval "$LIST_CMD" \
  | tr '\0' '\n' \
  | sort \
  | while IFS= read -r file; do
      if [ -f "$file" ]; then
        if [ -n "$HS_FALLBACK" ]; then
          # prefer HS_CMD; if it fails for any file, fallback
          $HS_CMD "$file" 2>/dev/null || $HS_FALLBACK "$file" 2>/dev/null || echo "warning: failed to hash $file" >&2
        else
          $HS_CMD "$file" 2>/dev/null || echo "warning: failed to hash $file" >&2
        fi
      else
        echo "warning: file disappeared: $file" >&2
      fi
    done >> "$tmpfile"

# Move tmp to output atomically
mv "$tmpfile" "$OUT"
echo "Wrote $(wc -l < \"$OUT\") entries to $OUT"
