# Use an official lightweight Python image
FROM python:3.9-slim AS base

# Set a working directory
WORKDIR /app

# Copy only the requirements first for efficient caching
COPY requirements.txt .

# Install dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the remaining application files
COPY . .

# Expose the port for the application
EXPOSE 8000

# Run the application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
