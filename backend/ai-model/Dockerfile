# Use Python 3.9 slim image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the requirements file to install dependencies
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the code
COPY . .

# Expose port (if you're running a Flask API, for example)
EXPOSE 5000

# Run the AI model or Flask API
CMD ["python", "analyzer.py"]
