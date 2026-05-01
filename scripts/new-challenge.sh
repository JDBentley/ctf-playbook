#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 3 ]; then
  echo "Usage: ./scripts/new-challenge.sh <ctf-name> <category> <challenge-name>"
  echo "Example: ./scripts/new-challenge.sh hack-red-con-2026 web login-bypass"
  exit 1
fi

CTF_NAME="$1"
CATEGORY="$2"
CHALLENGE_NAME="$3"

CHALLENGE_SLUG=$(echo "$CHALLENGE_NAME" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -cd '[:alnum:]-')
CHALLENGE_DIR="events/$CTF_NAME/challenges/$CATEGORY/$CHALLENGE_SLUG"

mkdir -p "$CHALLENGE_DIR"/{screenshots,logs,files,scripts,artifacts}

cat > "$CHALLENGE_DIR/notes.md" << EOF
# $CHALLENGE_NAME

## Challenge Info

CTF:
Category: $CATEGORY
Challenge:
Difficulty:
Points:
URL/File:

## Prompt

Paste prompt here.

[CAPTURE STILL]

Capture the initial prompt/interface as:

\`\`\`text
screenshots/01-prompt.png
\`\`\`

Why: this preserves the original challenge state for the writeup.

## Hypotheses

- 
- 
- 

## Enumeration

Commands:

\`\`\`bash

\`\`\`

Findings:

## Failed Attempts

Failure is useful. Capture it.

[CAPTURE STILL]

Save failed attempts as:

\`\`\`text
screenshots/02-failed-attempt.png
\`\`\`

Why: failures show your methodology and make the writeup more honest.

## Key Insight

## Exploit / Solution Path

## Flag

Do not publish the flag publicly.

\`\`\`text
FLAG REDACTED
\`\`\`

## Writeup Candidate?

Yes/No:

Why:
EOF

cat > "$CHALLENGE_DIR/solve.md" << EOF
# $CHALLENGE_NAME Technical Writeup

## Summary

Brief explanation of what the challenge tested.

## Category

$CATEGORY

## Skills Practiced

- 
- 
- 

## Methodology

### 1. Understanding the Challenge

### 2. Enumeration

### 3. Hypothesis

### 4. Testing

### 5. Exploitation

### 6. Result

Flag redacted.

## Commands Used

\`\`\`bash

\`\`\`

## Artifacts

- screenshots/
- logs/
- scripts/
- files/

## Key Takeaways

- 
- 
- 
EOF

cat > "$CHALLENGE_DIR/session-log.md" << EOF
# Session Log

Project: $CTF_NAME
Challenge: $CHALLENGE_NAME

## Goal

## What I Did

## What I Expected

## What Happened

## Problems

## Fixes

## Results

## Key Insight

## Next Step
EOF

touch "$CHALLENGE_DIR/logs/.gitkeep"
touch "$CHALLENGE_DIR/screenshots/.gitkeep"
touch "$CHALLENGE_DIR/files/.gitkeep"
touch "$CHALLENGE_DIR/scripts/.gitkeep"
touch "$CHALLENGE_DIR/artifacts/.gitkeep"

echo "[+] Created challenge workspace:"
echo "$CHALLENGE_DIR"
echo ""
echo "Next:"
echo "cd $CHALLENGE_DIR"
echo "ctf-tmux ${CHALLENGE_SLUG}"