#!/bin/bash
set -eou pipefail

if [[ "$OSTYPE" == "darwin"* ]]; then
    CHROME_BIN="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
    if [[ ! -f "$CHROME_BIN" ]]; then
        echo "Building on macOS requires standard Chrome installation"
        exit 2
    fi
else
    CHROME_DIR="chrome"
    CHROME_BIN="$CHROME_DIR/opt/google/chrome/google-chrome"

    if [[ ! -f "$CHROME_BIN" ]]; then
        echo "Installing chrome to $CHROME_DIR"
        mkdir -p "$CHROME_DIR"
        wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
        dpkg -x google-chrome-stable_current_amd64.deb "$CHROME_DIR"
        rm google-chrome-stable_current_amd64.deb
    fi
fi

hugo --cleanDestinationDir

echo "Using chrome binary at $CHROME_BIN"
"$CHROME_BIN" --headless --disable-gpu --run-all-compositor-stages-before-draw --print-to-pdf=public/MaxBickersResume.pdf --virtual-time-budget=6000 public/resume/index.html
rm -r public/resume
