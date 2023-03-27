# Use the official Node.js runtime as a parent image
FROM node:18-alpine

# Set the working directory to /app
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

RUN npm install -g npm@9.6.2
# Install dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Expose the port that the app listens on
EXPOSE 8080

# Start the app
CMD ["node", "app.js"]
