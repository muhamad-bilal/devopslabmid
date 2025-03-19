#!/bin/bash

echo "Building the application..."

# Step 1: Ensure pip is up-to-date
echo "Upgrading pip..."
pip install --upgrade pip

# Step 2: Install dependencies from requirements.txt
echo "Installing dependencies from requirements.txt..."
pip install -r requirements.txt

echo "Application build completed successfully!"
