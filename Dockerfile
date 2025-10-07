# Dockerfile

# Use the official lightweight Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app code
COPY main.py .

# Expose port (Cloud Run uses 8080)
EXPOSE 8080

# Start the app using uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
