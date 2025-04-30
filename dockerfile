# Use a maintained Node.js version
FROM node:18

# Create app directory
WORKDIR /app

# Copy dependency files
COPY package*.json ./

# Install production dependencies
RUN npm install --omit=dev

# Copy application source
COPY . .

# Add a non-root user (optional for security)
RUN adduser --disabled-password appuser
USER appuser

# Expose port
EXPOSE 3000

# Optional healthcheck
HEALTHCHECK CMD curl --fail http://localhost:3000 || exit 1

# Run the app
CMD ["node", "server.js"]
