# Step 1: Use a Node.js image to build the project
FROM node:18 AS builder

# Set the working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package.json package-lock.json ./
RUN npm install

# Copy the source code
COPY . .

# Build the project for production
RUN npm run build

# Step 2: Use a lightweight web server to serve the static files
FROM nginx:stable-alpine

# Copy the production build from the builder stage
COPY --from=builder /app/dist /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start NGINX server
CMD ["nginx", "-g", "daemon off;"]
