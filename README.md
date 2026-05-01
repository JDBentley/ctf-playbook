# ctf-playbook

A reusable CTF workflow, tooling, and documentation system for learning offensive security and building a professional portfolio.

---

## Why This Exists

Most CTF players solve challenges.

Few document their process in a way that is:

* reproducible
* explainable
* reviewable by others

This project focuses on:

* disciplined methodology
* evidence collection (screenshots + logs)
* structured problem solving
* clean technical writeups

---

## What This Demonstrates (Portfolio Value)

This repo showcases:

* Offensive security methodology
* Structured enumeration and testing
* Tooling automation and environment setup
* Documentation discipline (logs, screenshots, notes)
* Ability to explain technical work clearly

---

## Core Workflow

For each challenge:

1. Understand the prompt
2. Form hypotheses
3. Enumerate carefully
4. Test one idea at a time
5. Capture important moments
6. Document failures and successes
7. Solve
8. Prepare a private writeup
9. Publish after embargo lifts

---

## Repository Structure

```text
ctf-playbook/
├── scripts/
│   ├── setup-tools.sh        # Install tools + environment
│   ├── new-event.sh          # Create new CTF workspace
│   └── new-challenge.sh      # Create structured challenge folder
├── chromium-profile/         # Reusable browser profile
├── templates/                # Notes + writeup templates
└── events/                   # All CTF work lives here
```

---

## First-Time Setup (Ubuntu)

```bash
git clone https://github.com/jdbentley/ctf-playbook.git
cd ctf-playbook
chmod +x scripts/*.sh
./scripts/setup-tools.sh
```

---

## Browser Setup (CTF Profile)

Launch isolated Chromium profile:

```bash
chromium-ctf
```

Install extensions (once):

* FoxyProxy
* Wappalyzer
* Cookie-Editor
* HackTools

Profile location:

```text
~/.config/chromium-ctf-profile
```

---

## Starting a New CTF

```bash
./scripts/new-event.sh ctf
```

Creates:

```text
events/ctf/
├── challenges/
├── screenshots/
├── logs/
├── notes/
└── artifacts/
```

---

## Starting a New Challenge

```bash
./scripts/new-challenge.sh ctf category challenge
```

Creates:

```text
events/ctf/challenge/category/challenge name/
├── notes.md
├── solve.md
├── session-log.md
├── screenshots/
├── logs/
├── files/
├── scripts/
└── artifacts/
```

---

## Logging (Critical)

Start tmux logging before solving:

```bash
ctf-tmux challenge-name
```

Why this matters:

* preserves full command history
* captures failed attempts (critical for learning)
* enables accurate writeups
* allows full reproducibility

---

## Screenshots

Use Flameshot:

```bash
flameshot gui
```

Save into:

```text
screenshots/
```

Naming convention:

```text
01-prompt.png
02-enum.png
03-anomaly.png
04-failed.png
05-exploit.png
06-success.png
```

Capture both:

* successes
* failures (especially important)

---

## Example Workflow (Real Usage)

```bash
# Start event
./scripts/new-event.sh ctfname
cd events/ctfname

# Start logging session
ctf-tmux hack-red

# Create challenge
../../scripts/new-challenge.sh ctf category challenge
cd ctf/category/challenge
```

---

## Rules

* Do not publish flags
* Respect CTF embargo periods
* Do not attack systems outside scope
* Keep all work reproducible
* Document failures honestly

---

## Long-Term Goal

This repository is part of a larger effort to:

* build deep offensive security skillsets
* develop professional documentation habits
* prepare for advanced competitions (e.g. Black Badge path)

---
