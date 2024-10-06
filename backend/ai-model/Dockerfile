# Use Python 3.9 as the base image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the requirements.txt file
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose the port (if applicable, if you are serving an API)
EXPOSE 5000

# Run the AI model or application (update this to match your app’s entry point)
CMD ["python", "analyzer.py"]
