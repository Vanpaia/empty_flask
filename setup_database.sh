#!/usr/bin/env bash
set -e

echo "Setting up database..."

# verify venv
if [ ! -d "venv" ]; then
    echo "Virtualenv not found. Create it first with:"
    echo "python -m venv venv"
    exit 1
fi

# Activate venv
source venv/bin/activate

# Install dependencies if flask is not available
if ! command -v flask >/dev/null 2>&1; then
    echo "Installing dependencies..."
    pip install -r requirements.txt
fi

# Run migrations
mkdir -p instance
flask db upgrade

echo "Database setup complete!"
