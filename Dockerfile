# Use a lightweight Python base image
FROM python:3.10-slim

# Set the working directory inside the container
WORKDIR /app

# Copy only the necessary files
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the application port
EXPOSE 8000

# Set environment variables (if needed)
ENV OPENAI_API_KEY=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

# Command to run the FastAPI app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
