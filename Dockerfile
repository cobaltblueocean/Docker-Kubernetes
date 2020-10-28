# Use Alpine Linux 3.10 image and python v3.6
FROM alpine:3.10
FROM python:3.6

# Set the work directory
WORKDIR /app

# Add all assets in current directory to the '/app' folder in the container
ADD . /app

# Install packages listed in 'requirements.txt'
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Command receiving using port 80
EXPOSE 80

# Set environment variable in the Docker image
ENV NAME World

# Set command executed when container launched
CMD ["python", "app.py"]

