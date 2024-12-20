FROM python:3.9-slim AS base

# Set a working directory
WORKDIR /app

# Install SQLite3 support for Chroma
RUN pip install pysqlite3-binary

# Copy only the requirements first for efficient caching
COPY requirements.txt .

# Install dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the remaining application files
COPY . .

# Expose the port for the application
EXPOSE 80

# Run the application with Uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
