# Use an official Node runtime as a parent image
FROM node:lts

# Set the working directory to /app
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install --legacy-peer-deps

# Copy the application code to the working directory, excluding the 'backend' folder
COPY . .

# Build the React app
RUN npm run build

# Set the command to start the app
RUN npm install -g serve
CMD ["serve", "-s","build"]
