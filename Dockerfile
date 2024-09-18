# Use a CUDA-enabled base image
FROM nvidia/cuda:11.7.0-devel-ubuntu22.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary tools and dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    libboost-all-dev \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /usr/src/app

# Copy the Makefile, source code, and other necessary files
COPY . .

# Create the obj directory (if not already existing)
RUN mkdir -p obj

# Build the project using Makefile
RUN make