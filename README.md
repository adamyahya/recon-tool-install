# Recon Tools Installer for Kali Linux

A simple, one-click Bash script to check and install a curated set of popular **reconnaissance** and **bug bounty** tools on Kali Linux.

It automatically:
- Skips tools that are already installed
- Uses Kali repos (`apt`) when available for stability
- Falls back to `go install @latest`, git clones + pip, or direct builds for the rest
- Handles PATH additions (assumes `~/go/bin` is in your shell config)

Perfect for fresh Kali setups, VMs, or when you want the latest versions of ProjectDiscovery tools, subdomain enum, URL gathering, fuzzing, etc.

## Features – Tools Covered

**Subdomain Enumeration & DNS**
- subfinder
- amass
- chaos (ProjectDiscovery Chaos client)
- findomain
- assetfinder
- dnsx
- puredns (+ massdns)

**URL/Endpoint Gathering & Crawling**
- alterx
- httpx
- gau
- waybackurls
- katana
- gospider

**Fuzzing & Parameter Discovery**
- ffuf
- arjun
- paramspider

**Patterns & Replacement**
- gf
- qsreplace
- unfurl

**Scanning & Misc**
- rustscan (fast port scanner)
- nmap
- nuclei (vuln scanner)
- subjack (subdomain takeover)
- mapcidr (CIDR/IP tools)
- SecretFinder (JS secret finder)
- LinkFinder (endpoint finder in JS)
- s3scanner (AWS S3 bucket scanner)
- cloud_enum (cloud resource enum)

## Prerequisites

- Kali Linux (rolling / 2025–2026 recommended)
- Go 1.21+ installed (`go version` should work)
- `~/go/bin` in your `$PATH` (script assumes this – add via `export PATH="$HOME/go/bin:$PATH"` in `~/.zshrc`)
- `sudo` access (for apt, cp to /usr/local/bin, etc.)
- Internet connection
- git, curl/wget, python3-pip already available (Kali defaults)

## Installation & Usage

1. Clone or download this repo/folder:
   ```bash
   git clone https://github.com/yourusername/recon-tools-installer.git   # or just download zip
   cd recon-tools-installer
