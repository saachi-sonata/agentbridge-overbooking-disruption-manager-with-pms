# Dockerfile for Overbooking Disruption Manager with PMS
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm ci --only=production

# Copy source code
COPY src/ ./src/
COPY .env.example ./

# Create non-root user
RUN addgroup -g 1001 -S nodejs
RUN adduser -S agentbridge -u 1001

# Change ownership
RUN chown -R agentbridge:nodejs /app
USER agentbridge

# Expose port
EXPOSE 3000

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:3000/health || exit 1

# Start the application
CMD ["npm", "start"]
