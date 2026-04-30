#!/usr/bin/env bash
set -euo pipefail

echo "[*] Updating package lists..."
sudo apt update

echo "[*] Installing core CTF tools..."
sudo apt install -y \
  git \
  curl \
  wget \
  unzip \
  build-essential \
  python3 \
  python3-pip \
  python3-venv \
  tmux \
  flameshot \
  chromium-browser \
  nmap \
  netcat-openbsd \
  gobuster \
  ffuf \
  dirsearch \
  sqlmap \
  john \
  hashcat \
  binwalk \
  exiftool \
  steghide \
  foremost \
  file \
  strings \
  ltrace \
  strace \
  gdb \
  radare2 \
  checksec \
  wireshark \
  tcpdump \
  jq \
  ripgrep \
  xclip

echo "[*] Installing Python tooling..."
python3 -m pip install --user --upgrade pip
python3 -m pip install --user \
  pwntools \
  requests \
  beautifulsoup4 \
  pycryptodome \
  z3-solver \
  ropper \
  angr

echo "[*] Installing VS Code..."
if ! command -v code >/dev/null 2>&1; then
  wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
  sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/packages.microsoft.gpg
  sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
  rm packages.microsoft.gpg
  sudo apt update
  sudo apt install -y code
else
  echo "[*] VS Code already installed."
fi

echo "[*] Installing recommended VS Code extensions..."
code --install-extension ms-python.python || true
code --install-extension ms-vscode.cpptools || true
code --install-extension streetsidesoftware.code-spell-checker || true
code --install-extension yzhang.markdown-all-in-one || true
code --install-extension redhat.vscode-yaml || true

echo "[*] Creating reusable Chromium CTF profile..."
mkdir -p "$HOME/.config/chromium-ctf-profile"

cat > "$HOME/.local/bin/chromium-ctf" << 'EOF'
#!/usr/bin/env bash
chromium-browser \
  --user-data-dir="$HOME/.config/chromium-ctf-profile" \
  --no-first-run \
  --disable-sync
EOF

chmod +x "$HOME/.local/bin/chromium-ctf"

echo "[*] Creating tmux logging helper..."
cat > "$HOME/.local/bin/ctf-tmux" << 'EOF'
#!/usr/bin/env bash
SESSION_NAME="${1:-ctf}"
mkdir -p logs
tmux new-session -s "$SESSION_NAME" \; pipe-pane -o "cat >> logs/tmux-$(date +%Y%m%d-%H%M%S).log"
EOF

chmod +x "$HOME/.local/bin/ctf-tmux"

echo "[+] Tool setup complete."
echo ""
echo "Next steps:"
echo "1. Run: chromium-ctf"
echo "2. Install browser extensions manually into that profile:"
echo "   - FoxyProxy"
echo "   - Wappalyzer"
echo "   - Cookie-Editor"
echo "   - HackTools"
echo "3. Close Chromium. The profile will persist at:"
echo "   ~/.config/chromium-ctf-profile"