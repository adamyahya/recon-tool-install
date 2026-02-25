┌──(adam㉿kali)-[~]
└─$ ./install-recon-tools.sh
Bash
Updating apt package list first...
Get:1 http://kali.download/kali kali-rolling InRelease [34.0 kB]
Get:2 http://kali.download/kali kali-rolling/main amd64 Packages [20.7 MB]
Get:3 http://kali.download/kali kali-rolling/main amd64 Contents (deb) [52.3 MB]                                                                                                                                 
Get:4 http://kali.download/kali kali-rolling/contrib amd64 Packages [116 kB]                                                                                                                                     
Get:5 http://kali.download/kali kali-rolling/contrib amd64 Contents (deb) [274 kB]                                                                                                                               
Get:6 http://kali.download/kali kali-rolling/non-free amd64 Packages [184 kB]                                                                                                                                    
Get:7 http://kali.download/kali kali-rolling/non-free amd64 Contents (deb) [877 kB]                                                                                                                              
Get:8 http://kali.download/kali kali-rolling/non-free-firmware amd64 Packages [14.2 kB]                                                                                                                          
Get:9 http://kali.download/kali kali-rolling/non-free-firmware amd64 Contents (deb) [33.2 kB]                                                                                                                    
Fetched 74.5 MB in 25s (2,930 kB/s)                                                                                                                                                                              
2123 packages can be upgraded. Run 'apt list --upgradable' to see them.
=====================================
Installing / Checking tools...
=====================================
/usr/bin/subfinder
[OK] subfinder is already installed → /usr/bin/subfinder
/usr/bin/dnsx
[OK] dnsx is already installed → /usr/bin/dnsx
/home/adam/go/bin/alterx
[OK] alterx is already installed → /home/adam/go/bin/alterx
/usr/bin/httpx
[OK] httpx is already installed → /usr/bin/httpx
/home/adam/go/bin/katana
[OK] katana is already installed → /home/adam/go/bin/katana
/usr/bin/nuclei
[OK] nuclei is already installed → /usr/bin/nuclei
/home/adam/go/bin/chaos
[OK] chaos is already installed → /home/adam/go/bin/chaos
/usr/bin/amass
[OK] amass is already installed → /usr/bin/amass
/usr/bin/assetfinder
[OK] assetfinder is already installed → /usr/bin/assetfinder
/home/adam/go/bin/gau
[OK] gau is already installed → /home/adam/go/bin/gau
/home/adam/go/bin/waybackurls
[OK] waybackurls is already installed → /home/adam/go/bin/waybackurls
/home/adam/go/bin/gf
[OK] gf is already installed → /home/adam/go/bin/gf
/home/adam/go/bin/qsreplace
[OK] qsreplace is already installed → /home/adam/go/bin/qsreplace
/home/adam/go/bin/unfurl
[OK] unfurl is already installed → /home/adam/go/bin/unfurl
/home/adam/go/bin/mapcidr
[OK] mapcidr is already installed → /home/adam/go/bin/mapcidr
/home/adam/go/bin/subjack
[OK] subjack is already installed → /home/adam/go/bin/subjack
/usr/bin/rustscan
[OK] rustscan is already installed → /usr/bin/rustscan
/usr/bin/nmap
[OK] nmap is already installed → /usr/bin/nmap
/usr/bin/findomain
[OK] findomain is already installed → /usr/bin/findomain
/usr/bin/gospider
[OK] gospider is already installed → /usr/bin/gospider
/usr/bin/cloud_enum
[OK] cloud_enum is already installed → /usr/bin/cloud_enum
/usr/bin/ffuf
[OK] ffuf is already installed → /usr/bin/ffuf
/usr/bin/arjun
[OK] arjun is already installed → /usr/bin/arjun
/usr/bin/paramspider
[OK] paramspider is already installed → /usr/bin/paramspider
[OK] SecretFinder is already installed → 
[OK] LinkFinder is already installed → 
/usr/bin/s3scanner
[OK] s3scanner is already installed → /usr/bin/s3scanner
[OK] puredns is already installed → 

=====================================
All done! Check versions / help:
  subfinder -h     httpx -h     nuclei -update
  chaos -h         rustscan --version
  If any tool still missing → check PATH or run 'source ~/.zshrc'
  For chaos → get free API key at https://chaos.projectdiscovery.io/
=====================================
Command 'Bash' not found, did you mean:
  command 'sash' from deb sash
  command 'mash' from deb mash
  command 'gash' from deb gash
  command 'yash' from deb yash
  command 'kash' from deb kanif
  command 'wash' from deb reaver
  command 'bash' from deb bash
  command 'dash' from deb dash
Try: sudo apt install <deb name>
                                   
