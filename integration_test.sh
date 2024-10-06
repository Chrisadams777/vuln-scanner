#!/bin/bash

# Run Go crawler and fuzzer
echo "Running Go crawler and fuzzer..."
go run backend/go-crawler/main.go http://example.com

# Start AI Flask model in background
echo "Starting AI model..."
python3 backend/ai-model/flask_app.py &

# Wait for Flask app to be ready
sleep 5

# Test Flask API with a sample request
echo "Testing AI model..."
curl -X POST -H "Content-Type: application/json" -d '{"data": [[0.5, 0.4, 0.3, 0.2, 0.1, 0.6, 0.7, 0.8, 0.9, 1.0]]}' http://localhost:5001/predict

# Run Puppeteer tests
echo "Running Puppeteer tests..."
node frontend/puppeteer-test/index.js

# Kill background Flask process
kill %1
