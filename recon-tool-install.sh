
# Script to install common recon / 
# Assumes: Go installed + ~/go/bin in PATH, apt updated, git & python3-pip available

set -euo pipefail

echo "Updating apt package list first..."
sudo apt update -y

# Helper function
install_if_missing() {
    local cmd="$1"
    local install_cmd="$2"

    if command -v "$cmd" &> /dev/null; then
        echo "[OK] $cmd is already installed → $(which "$cmd")"
    else
        echo "[INSTALL] Installing $cmd ..."
        eval "$install_cmd"
        echo "[DONE] $cmd installed."
    fi
}

echo "====================================="
echo "Installing / Checking tools..."
echo "====================================="

# ── ProjectDiscovery suite (Go tools) ───────────────────────────────────────
install_if_missing "subfinder"  "go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest"
install_if_missing "dnsx"       "go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest"
install_if_missing "alterx"     "go install -v github.com/projectdiscovery/alterx/cmd/alterx@latest"
install_if_missing "httpx"      "go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest"
install_if_missing "katana"     "go install -v github.com/projectdiscovery/katana/cmd/katana@latest"
install_if_missing "nuclei"     "go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest"

# Chaos needs special note (chaos-client binary is named chaos)
install_if_missing "chaos"      "go install -v github.com/projectdiscovery/chaos-client/cmd/chaos@latest"

# ── Other Go-based recon tools ──────────────────────────────────────────────
install_if_missing "amass"         "go install -v github.com/owasp-amass/amass/v4/...@latest"
install_if_missing "assetfinder"   "go install -v github.com/tomnomnom/assetfinder@latest"
install_if_missing "gau"           "go install -v github.com/lc/gau/v2/cmd/gau@latest"
install_if_missing "waybackurls"   "go install -v github.com/tomnomnom/waybackurls@latest"
install_if_missing "gf"            "go install -v github.com/tomnomnom/gf@latest"
install_if_missing "qsreplace"     "go install -v github.com/tomnomnom/qsreplace@latest"
install_if_missing "unfurl"        "go install -v github.com/tomnomnom/unfurl@latest"
install_if_missing "mapcidr"       "go install -v github.com/projectdiscovery/mapcidr/cmd/mapcidr@latest"
install_if_missing "subjack"       "go install -v github.com/haccer/subjack@latest"

# ── RustScan (fastest via .deb if possible, fallback to cargo) ──────────────
install_if_missing "rustscan" "
    if ! command -v rustscan >/dev/null; then
        echo 'Downloading latest RustScan .deb (check https://github.com/RustScan/RustScan/releases if link outdated)'
        wget -q https://github.com/RustScan/RustScan/releases/download/2.2.3/rustscan_2.2.3_amd64.deb -O /tmp/rustscan.deb
        sudo dpkg -i /tmp/rustscan.deb || sudo apt install -f -y
        rm -f /tmp/rustscan.deb
    fi"

# If .deb fails or you prefer cargo (uncomment if needed):
# install_if_missing "cargo" "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y && source $HOME/.cargo/env"
# then: cargo install rustscan

# ── Tools in Kali repositories ──────────────────────────────────────────────
install_if_missing "nmap"       "sudo apt install -y nmap"
install_if_missing "findomain"  "sudo apt install -y findomain"
install_if_missing "gospider"   "sudo apt install -y gospider"
install_if_missing "cloud_enum" "sudo apt install -y cloud-enum"

# ── Python / git-based tools ────────────────────────────────────────────────
install_if_missing "ffuf" "
    go install github.com/ffuf/ffuf/v2@latest"

install_if_missing "arjun" "
    sudo apt install -y python3-pip
    pip3 install arjun"

install_if_missing "paramspider" "
    git clone https://github.com/devanshbatham/ParamSpider /tmp/ParamSpider
    cd /tmp/ParamSpider
    pip3 install -r requirements.txt
    sudo cp paramspider.py /usr/local/bin/paramspider
    sudo chmod +x /usr/local/bin/paramspider
    cd - >/dev/null
    rm -rf /tmp/ParamSpider"

install_if_missing "SecretFinder" "
    git clone https://github.com/m4ll0k/SecretFinder.git /tmp/SecretFinder
    cd /tmp/SecretFinder
    pip3 install -r requirements.txt
    sudo cp SecretFinder.py /usr/local/bin/SecretFinder
    sudo chmod +x /usr/local/bin/SecretFinder
    cd - >/dev/null
    rm -rf /tmp/SecretFinder"

install_if_missing "LinkFinder" "
    git clone https://github.com/GerbenJavado/LinkFinder.git /tmp/LinkFinder
    cd /tmp/LinkFinder
    sudo python3 setup.py install
    cd - >/dev/null
    rm -rf /tmp/LinkFinder"

install_if_missing "s3scanner" "
    go install -v github.com/sa7mon/S3Scanner@latest"

# puredns (requires special install - go + massdns)
install_if_missing "puredns" "
    go install -v github.com/d3mondev/puredns/v2@latest
    # puredns needs massdns - install it too if missing
    if ! command -v massdns >/dev/null; then
        git clone https://github.com/blechschmidt/massdns /tmp/massdns
        cd /tmp/massdns
        make
        sudo cp bin/massdns /usr/local/bin/
        cd - >/dev/null
        rm -rf /tmp/massdns
    fi"

echo ""
echo "====================================="
echo "All done! Check versions / help:"
echo "  If any tool still missing → check PATH or run 'source ~/.zshrc'"
echo "  For chaos → get free API key at https://chaos.projectdiscovery.io/"
echo "====================================="
