# Base image
FROM mcr.microsoft.com/devcontainers/typescript-node:0-20

# Install additional dependencies
RUN apt-get update \
    && apt-get install -y build-essential \
    && apt-get clean

# Install TypeScript
RUN npm install -g typescript@latest

# Install SQLite
RUN apt-get update \
    && apt-get install -y sqlite3 \
    && apt-get clean

