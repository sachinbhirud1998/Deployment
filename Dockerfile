FROM python:3.8-slim-buster

# Install necessary system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    python3-dev \
    libatlas-base-dev \
    gfortran \
    awscli

# Set the working directory
WORKDIR /app

# Copy the requirements.txt first for caching
COPY requirements.txt /app/

# Upgrade pip and install dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt --verbose  # Verbose for detailed output

# Copy the rest of the code into the container
COPY . /app

# Set the default command to run the app
CMD ["python3", "app.py"]
