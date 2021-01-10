#!/bin/sh
hugo -D
/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --headless --disable-gpu --run-all-compositor-stages-before-draw --print-to-pdf=public/MaxBickersResume.pdf --virtual-time-budget=6000 public/resume/index.html
