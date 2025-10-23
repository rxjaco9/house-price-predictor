# Use Python 3.11 slim image
FROM python:3.11-slim

# Prevent Python from writing .pyc and enable stdout/stderr flush
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    STREAMLIT_SERVER_PORT=8501

WORKDIR /app

# Install minimal system deps needed by common ML/visual libs
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    gcc \
    libgl1 \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies (use project's requirements.txt)
COPY requirements.txt .
RUN python -m pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Make a non-root user for safety
RUN useradd -m appuser && chown -R appuser:appuser /app
USER appuser

# Expose default Streamlit port (change if you run an API instead)
EXPOSE 8501

# Default command: run the Streamlit UI if present.
# If you want to run an API instead, replace this CMD with the appropriate uvicorn command.
CMD ["streamlit", "run", "streamlit_app/app.py", "--server.port", "8501", "--server.address", "0.0.0.0"]