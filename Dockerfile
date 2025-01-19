# Use the official Node.js image as a base
FROM node:18 AS builder

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock) first
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the application
RUN npm run build

# Use a lightweight server to serve the application
FROM node:18 AS production

# Set the working directory
WORKDIR /app

# Copy the built files from the builder stage
COPY --from=builder /app/dist ./dist

# Install only production dependencies
COPY package*.json ./
RUN npm install --only=production

# Expose the port that the app runs on
EXPOSE 8080

# Command to run the application
CMD ["npx", "serve", "dist"]
