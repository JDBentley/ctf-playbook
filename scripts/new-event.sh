#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Usage: ./scripts/new-event.sh <ctf-name>"
  echo "Example: ./scripts/new-event.sh hack-red-con-2026"
  exit 1
fi

CTF_NAME="$1"
EVENT_DIR="events/$CTF_NAME"

mkdir -p "$EVENT_DIR"/{challenges,screenshots,logs,notes,artifacts}

cat > "$EVENT_DIR/README.md" << EOF
# $CTF_NAME

## Summary

Private CTF workspace for solving challenges, collecting notes, and preparing writeups after embargo lifts.

## Rules

- Do not publish flags.
- Do not publish writeups before embargo lifts.
- Keep all steps reproducible.
- Capture failures and successes.

## Structure

\`\`\`text
challenges/   Individual challenge folders
screenshots/  Event-level screenshots
logs/         tmux logs and command output
notes/        General event notes
artifacts/    Downloaded files or generated outputs
\`\`\`

## Blog Candidates

Track challenges that would make strong writeups here.

| Challenge | Category | Why it is worth writing about |
|----------|----------|-------------------------------|
| TBD | TBD | TBD |
EOF

touch "$EVENT_DIR/logs/.gitkeep"
touch "$EVENT_DIR/screenshots/.gitkeep"
touch "$EVENT_DIR/artifacts/.gitkeep"

echo "[+] Created event workspace: $EVENT_DIR"
echo ""
echo "Next:"
echo "cd $EVENT_DIR"
echo "ctf-tmux $CTF_NAME"