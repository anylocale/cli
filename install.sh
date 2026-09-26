#!/bin/sh
# anylocale-install.sh - installs the anylocale CLI without Homebrew.
#
#   curl -fsSL https://anylocale.com/install.sh | sh
#
# Served at /install.sh on the anylocale host by a next.config.ts rewrite, and
# self-contained rather than sourcing public/install.sh: a piped script has no
# name to read its brand from and nothing to source from either.
#
# `/anylocale.sh` is public/pull-strings.sh under another name; the NAME is what
# the tool reads its brand from, so it must land as `anylocale`.
#
# Environment:
#   ANYLOCALE_INSTALL_DIR  (optional) target directory, overrides the default
#   ANYLOCALE_URL          (optional) host to download from

set -eu

BASE_URL="${ANYLOCALE_URL:-https://anylocale.com}"
TOOL_NAME="anylocale"

# /usr/local/bin when the caller can write it, the user-local bin dir otherwise
# - never sudo on the user's behalf.
if [ -n "${ANYLOCALE_INSTALL_DIR:-}" ]; then
  INSTALL_DIR="$ANYLOCALE_INSTALL_DIR"
elif [ -d /usr/local/bin ] && [ -w /usr/local/bin ]; then
  INSTALL_DIR=/usr/local/bin
else
  INSTALL_DIR="$HOME/.local/bin"
fi

mkdir -p "$INSTALL_DIR"
# On download failure remove the target: curl -f can still leave an empty file
# behind, and a zero-byte `anylocale` on the PATH is worse than no install.
if ! curl -fsSL "$BASE_URL/anylocale.sh" -o "$INSTALL_DIR/$TOOL_NAME"; then
  rm -f "$INSTALL_DIR/$TOOL_NAME"
  echo "Download failed: $BASE_URL/anylocale.sh" >&2
  exit 1
fi
chmod +x "$INSTALL_DIR/$TOOL_NAME"
echo "Installed $INSTALL_DIR/$TOOL_NAME"

case ":$PATH:" in
  *":$INSTALL_DIR:"*) ;;
  # Both syntaxes: fish does not understand `export VAR=...`.
  *) echo "Note: $INSTALL_DIR is not on your PATH. Add it with:
  export PATH=\"$INSTALL_DIR:\$PATH\"      # bash, zsh, sh
  fish_add_path $INSTALL_DIR              # fish" ;;
esac

echo "
Next steps:
  1. Create an API token (read scope is enough) in your project's
     Settings -> Integrations screen on $BASE_URL
  2. Export it:  export ANYLOCALE_TOKEN=cm_live_...
  3. Pull:       anylocale sync --project <slug> --out-dir <dir>"
