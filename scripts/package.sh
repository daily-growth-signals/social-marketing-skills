#!/bin/bash
# Build a release zip that contains only skills/ contents (no scripts, no local guides).

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
SKILLS_DIR="${PROJECT_ROOT}/skills"
OUTPUT_DIR="${PROJECT_ROOT}/dist"

resolve_version() {
  local raw="${1:-}"
  if [ -z "${raw}" ]; then
    raw="$(git -C "${PROJECT_ROOT}" describe --tags --abbrev=0 2>/dev/null || true)"
  fi
  if [ -z "${raw}" ]; then
    raw="$(sed -n 's/^[[:space:]]*"version"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' "${PROJECT_ROOT}/package.json" | head -1)"
  fi
  if [ -z "${raw}" ]; then
    echo "Error: could not resolve version (pass vX.Y.Z, or set package.json version)" >&2
    exit 1
  fi
  case "${raw}" in
    v*) echo "${raw}" ;;
    *) echo "v${raw}" ;;
  esac
}

VERSION="$(resolve_version "${1:-}")"
PACKAGE_NAME="social-marketing-skills-${VERSION}"
OUTPUT_FILE="${OUTPUT_DIR}/${PACKAGE_NAME}.zip"

mkdir -p "${OUTPUT_DIR}"
rm -f "${OUTPUT_FILE}"

cd "${SKILLS_DIR}"
zip -r "${OUTPUT_FILE}" \
  zhihu-article-creator/ \
  xiaohongshu-post-creator/ \
  README.md \
  -x "*.DS_Store" \
  -x "*__pycache__/*"

echo "Package: ${OUTPUT_FILE}"
echo "Size: $(du -h "${OUTPUT_FILE}" | cut -f1)"
unzip -l "${OUTPUT_FILE}"
