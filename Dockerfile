# Base image
FROM node:18 
# Set working directory
WORKDIR /app
# Copy package.json and package-lock.json
COPY package*.json ./
# Install dependicies 
RUN npm install
# Copy rest of the appcode
COPY . . 
# Expose port
EXPOSE 3000
# Start app
CMD ["npm", "start"]
