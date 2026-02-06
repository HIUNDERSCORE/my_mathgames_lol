# Use a slim Node.js image to save memory
FROM node:18-slim

# Set the working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of your code
COPY . .

# Expose the port (Koyeb uses 8080 by default)
EXPOSE 8080

# Start the application
CMD ["node", "index.mjs"]
