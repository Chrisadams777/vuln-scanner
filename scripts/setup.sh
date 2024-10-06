#!/bin/bash

# Install Go
echo "Installing Go..."
sudo apt update
sudo apt install golang-go -y

# Install Python3 and Pip
echo "Installing Python3 and Pip..."
sudo apt install python3 python3-pip -y

# Install Node.js and Puppeteer
echo "Installing Node.js and Puppeteer..."
sudo apt install nodejs npm -y
npm install puppeteer

# Install Python dependencies
echo "Installing Python dependencies..."
pip3 install -r backend/ai-model/requirements.txt

# Set up Docker
echo "Installing Docker..."
sudo apt install docker.io docker-compose -y

# Start Docker containers
echo "Starting Docker containers..."
docker-compose up -d

# Run Go crawler
echo "Running Go crawler..."
go run backend/go-crawler/main.go http://example.com

# Run Puppeteer tests
echo "Running Puppeteer tests..."
node frontend/puppeteer-test/index.js

echo "Setup complete!"
