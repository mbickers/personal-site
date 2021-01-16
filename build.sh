#!/bin/bash
set -eou pipefail

# Check if building locally or on Netlify
if [[ "$OSTYPE" == "darwin"* ]]; then
    CHROME_BIN=/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome
    if [ ! -f "$CHROME_BIN" ]; then
        echo "Building on macOS requires standard Chrome installation"
        exit 2
    fi
else
    # Install Chrome
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    mkdir chrome
    dpkg -x google-chrome-stable_current_amd64.deb chrome
    rm google-chrome-stable_current_amd64.deb
    CHROME_BIN="chrome/opt/google/chrome/google-chrome"
fi

hugo --cleanDestinationDir

"$CHROME_BIN" --headless --disable-gpu --run-all-compositor-stages-before-draw --print-to-pdf=public/MaxBickersResume.pdf --virtual-time-budget=6000 public/resume/index.html
rm -r public/resume
