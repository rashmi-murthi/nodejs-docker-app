
# stage 1 Build stage 
FROM node:18-alpine AS builder
# set working directory 
WORKDIR /app
# copy package.json and package.lock.json 
COPY package*.json ./
# install dependencies 
RUN npm ci --only=production
# Copy application sourcecode 
COPY . .

# stage 2 Run stage 
FROM node:18-alpine
# set working directory 
WORKDIR /app
COPY --from=builder /app .
# expose application port ( change based on your app's port )
EXPOSE 3000
# set environment variable 
ENV NODE_ENV=production
# start the app 
CMD ["npm", "start"]
