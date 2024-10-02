FROM ubuntu:latest
MAINTAINER Tuan Thai "tuanthai@example.com"

# Update and install necessary packages
RUN apt update -y && \
    apt install -y python3-pip python3-dev build-essential python3-venv

# Set the working directory
WORKDIR /flask_app

# Add application files to the container
ADD . /flask_app

# Create a virtual environment and install dependencies
RUN python3 -m venv venv && \
    venv/bin/pip install --upgrade pip && \
    venv/bin/pip install -r requirements.txt

# Set the entry point to your Flask application
CMD ["venv/bin/python", "flask_docker.py"]
