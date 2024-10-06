#!/bin/bash

# Stop the script if any command fails
set -e

echo "Updating system packages..."
sudo apt update

# Install Go
echo "Installing Go..."
sudo apt install golang-go -y

# Install Node.js and Puppeteer
echo "Installing Node.js and Puppeteer..."
sudo apt install nodejs npm -y
sudo npm install -g puppeteer

# Install Python and dependencies
echo "Installing Python3 and venv..."
sudo apt install python3 python3-pip python3-venv -y

# Create a virtual environment and activate it
echo "Creating a Python virtual environment..."
python3 -m venv venv

# Activate the virtual environment
source venv/bin/activate

# Install Python dependencies inside the virtual environment
echo "Installing Python dependencies..."
pip install -r requirements.txt

# Install Docker according to GeeksForGeeks instructions (for Kali Linux)
echo "Installing Docker..."
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io -y
sudo systemctl start docker
sudo systemctl enable docker

# Add user to the docker group (avoids needing sudo to run Docker)
sudo usermod -aG docker $USER

# Set up Docker containers
echo "Setting up Docker containers..."
sudo docker-compose up -d

# Run the Go Web Crawler and Fuzzer
echo "Running the Go Web Crawler and Fuzzer..."
go run backend/go-crawler/main.go http://example.com

# Run the Puppeteer tests
echo "Running the Puppeteer tests..."
sudo node frontend/puppeteer-test/index.js

echo "Setup complete! Make sure to log out and log back in for Docker permissions to take effect."
