#!/usr/bin/env bash

if [ $# -eq 0 ]; then
    echo "Please provide a number as an argument to tag the images with. e.g. ./build_images.sh 4"
    exit 1
fi

echo "Creating temp dir"
mkdir temp && cd temp

# Clone the repo
git clone https://github.com/software-containerization/todo.git

# Build the image
sudo docker build -t localhost:32000/todo-api:v$1 todo/todo-backend
sudo docker build -t localhost:32000/todo-frontend:v$1 todo/todo-frontend
# Enable microk8s registry
sudo microk8s start
sudo microk8s enable registry

# Push to the microk8s registry
sudo docker push localhost:32000/todo-api:v$1
sudo docker push localhost:32000/todo-frontend:v$1

echo "Removing temp dir"
cd .. && rm -rf temp
