# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in dependency.txt
RUN pip install --no-cache-dir -r dependency.txt

# Run randomForest.py when the container launches
CMD ["python", "randomForest.py"]