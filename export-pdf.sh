#!/usr/bin/env bash
# Export index.html to PDF with headless Chrome on Windows (run from WSL).
set -euo pipefail
cd "$(dirname "$0")"
CHROME="/mnt/c/Program Files/Google/Chrome/Application/chrome.exe"
DISTRO="${WSL_DISTRO_NAME:-Ubuntu}"
WIN_SRC="file://wsl.localhost/${DISTRO}$(pwd)/index.html"
WIN_TMP="$(cmd.exe /c 'echo %TEMP%' 2>/dev/null | tr -d '\r')"
OUT_WIN="${WIN_TMP}\\cv-export.pdf"
OUT_WSL="$(wslpath "$OUT_WIN")"
rm -f "$OUT_WSL"
# own profile dir so a running Chrome window (or a stuck headless one) cannot block the export
"$CHROME" --headless=new --disable-gpu --no-pdf-header-footer \
  --user-data-dir="${WIN_TMP}\\cv-export-profile" \
  --print-to-pdf="$OUT_WIN" "$WIN_SRC" 2>/dev/null || true
if [ ! -s "$OUT_WSL" ]; then echo "export failed: Chrome produced no PDF" >&2; exit 1; fi
mv "$OUT_WSL" "Linda Giorgi's resume.pdf"
chmod 644 "Linda Giorgi's resume.pdf"
echo "PDF written: Linda Giorgi's resume.pdf ($(grep -ac '/Type /Page$\|/Type /Page[^s]' "Linda Giorgi's resume.pdf") pages)"
