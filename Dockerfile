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

# Copy the requirements.txt before the rest of the code to leverage Docker cache
COPY requirements.txt /app/

# Upgrade pip to the latest version
RUN pip install --upgrade pip

# Install Python dependencies
RUN pip install -r requirements.txt

# Copy the rest of the code into the container
COPY . /app

# Set the default command to run the app
CMD ["python3", "app.py"]
