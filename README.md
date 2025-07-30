# Node.js Docker App

A simple Node.js application running on [Express](https://expressjs.com/) and containerized using Docker. It serves a basic "Hello World" message at the root URL.

## 🚀 Features

- Lightweight Express server
- Dockerized for easy deployment
- Node.js 18 LTS base image

## 📁 Project Structure
nodejs-docker-app/
├── Dockerfile
├── index.js
├── package.json
├── package-lock.json
└── .gitignore

## 🐳 Docker Instructions

# Build the Docker image
docker build -t your-dockerhub-username/my-app:0.0.1.RELEASE .

# Run the container in detached mode, mapping port 3000
docker run -d -p 3000:3000 your-dockerhub-username/my-app:0.0.1.RELEASE

Open your browser and go to:
http://localhost:3000 

You should see: Hello World!

