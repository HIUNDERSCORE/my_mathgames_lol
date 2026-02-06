# Alpine is the smallest possible base image
FROM node:18-alpine

# Set the environment to production to skip heavy dev tools
ENV NODE_ENV=production
WORKDIR /app

# Copy only package files first
COPY package*.json ./

# Install ONLY production dependencies to save RAM
RUN npm install --omit=dev

# Copy the code
COPY . .

# Force Koyeb to use port 8080
ENV PORT=8080
EXPOSE 8080

# Start with a direct node command
CMD ["node", "index.mjs"]
