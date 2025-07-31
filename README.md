# 🚀 Node.js Docker App with Basic and Multistage Dockerfiles

This project demonstrates a simple Node.js application packaged with **two different Dockerfiles**:
- A **basic Dockerfile** using Debian-based Node image
- A **multistage Dockerfile** using lightweight Alpine-based Node image

The project also highlights a common troubleshooting case: **why `bash` works in one container but not in another**, and how to fix or work around it.

## 📁 Project Structure

```
nodejs-docker-app/
├── Dockerfile               # Basic Dockerfile (Debian-based)
├── multistage/
│   └── Dockerfile           # Multistage Dockerfile (Alpine-based)
├── index.js
├── package.json
├── package-lock.json
└── README.md
```

## 🧱 1. Build and Run — Basic Dockerfile

### 🔨 Build
```bash
docker build -t myapp:basic .
```

### ▶️ Run
```bash
docker run -d -p 3000:3000 --name cont-basic myapp:basic
```

### 🐚 Access the container
```bash
docker exec -it cont-basic bash
```

Expected output:
```
root@container-id:/app#
```

## 🏗️ 2. Build and Run — Multistage Dockerfile

### 🔨 Build (with correct context)
```bash
docker build -f multistage/Dockerfile -t myapp:multi .
```

### ▶️ Run
```bash
docker run -d -p 3001:3000 --name cont-multi myapp:multi
```

### 🐚 Access the container
```bash
docker exec -it cont-multi sh
```

Expected output:
```
/app #
```

## 🤔 Why `bash` Fails in Multistage and Works in Basic

### ✅ What Happened?
- **Basic container** uses `node:18` (Debian-based) → includes `bash`
- **Multistage container** uses `node:18-alpine` → only includes `sh`

### ❌ Error on Alpine when using bash:
```bash
OCI runtime exec failed: exec: "bash": executable file not found
```

### ✅ Solution
Use `sh` instead:
```bash
docker exec -it cont-multi sh
```

## 🔍 Confirm You’re Still Root in Both
```bash
whoami
# Output: root
```
---

## 🌐 Test the Application

Open your browser and go to:  

http://localhost:3000 # for basic build  

http://localhost:3001 # for multistage build  

You should see: Hello World!

## 📚 Educational Value
- Understand multi-stage builds
- Compare Alpine vs Debian Node.js base images
- Practice real-world troubleshooting

## 🙋‍♀️ Maintainer
**Rashmi Murthi**  
DevOps Learner | AWS Explorer | Docker Enthusiast 🚀


