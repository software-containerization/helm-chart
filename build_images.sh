#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "Creating temp dir"
mkdir temp && cd temp

# Clone the repo
git clone https://github.com/software-containerization/todo.git

# Build the image
docker build -t localhost:32000/todo-api:v1 todo/todo-backend

# Enable microk8s registry
microk8s start
microk8s enable registryk

# Push to the microk8s registry
docker push localhost:32000/todo-api:v1

# frontend

docker build --build-args API_URL=yamlparse(apiUrl) -t localhost:32000/todo-api:v1 todo/todo-backend

docker run -e API_URL=iets
echo "Removing temp dir"
cd .. && rm -rf temp
