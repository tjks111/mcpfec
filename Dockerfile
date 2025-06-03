# Use a base image that includes both Node.js and Python, or install one on top of the other.
# This example uses a Node.js base image and installs Python.
FROM node:alpine

# Install Python and pip
RUN apk add --no-cache python3 py3-pip

# Set the working directory inside the container
WORKDIR /app

# Copy your project files into the container
COPY . /app/

# Make the build script executable (optional, but good practice in Docker)
RUN chmod +x build.sh

# Execute the build script
RUN sh ./build.sh

# Command to run when the container starts
# This uses the start command you configured for mcpo
CMD ["mcpo", "--config", "mcpo-config.json", "--port", "$PORT"]
