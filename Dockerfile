FROM python:3.8-slim-buster

# Update and install necessary dependencies
RUN apt update -y && apt install -y awscli build-essential libpq-dev

# Set the working directory
WORKDIR /app

# Copy only the requirements file first to leverage Docker cache efficiently
COPY requirements.txt /app/

# Upgrade pip and install Python dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy the rest of the app files into the container
COPY . /app

# Set the default command to run the app
CMD ["python3", "app.py"]
