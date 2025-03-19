#!/bin/bash

echo "Running tests..."

# Step 1: Ensure dependencies are installed (if not already done in build.sh)
echo "Installing dependencies..."
pip install --upgrade pip  # Ensure pip is the latest version
pip install -r requirements.txt  # Install dependencies if not already installed

# Step 2: Run unit tests
echo "Running unit tests..."
pytest tests/unit/ --maxfail=1 --disable-warnings -q  # Run unit tests located in the 'tests/unit/' folder

# Step 3: Run integration tests
echo "Running integration tests..."
pytest tests/integration/ --maxfail=1 --disable-warnings -q  # Run integration tests in the 'tests/integration/' folder

# Step 4: Check if tests passed
if [ $? -eq 0 ]; then
    echo "All tests passed successfully!"
else
    echo "Some tests failed. Please check the logs."
    exit 1  # Exit with an error code if tests fail
fi
