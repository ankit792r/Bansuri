#!/usr/bin/env bash
set -e

echo "Installing Bansuri"

# Ensure python exists
if ! command -v python3 >/dev/null 2>&1; then
    echo "Python3 not found. Install it first."
    exit 1
fi

# Run installer
python3 install/main.py

