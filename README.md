# Hello World App

Welcome to HelloWorldApp! This project demonstrates how to containerize a simple "Hello World" application, deploy it to a Kubernetes cluster using Terraform, and integrate it with ActiveMQ for message queuing.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
  - [1. Clone the Repository](#1-clone-the-repository)
  - [2. Dockerize the Application](#2-dockerize-the-application)
  - [3. Kubernetes Setup](#3-kubernetes-setup)
  - [4. Deploy with Terraform](#4-deploy-with-terraform)
  - [5. Set Up ActiveMQ](#5-set-up-activemq)
  - [6. Access the Application](#6-access-the-application)
- [Cleanup](#cleanup)
- [Approach](#approach)
- [Challenges and Solutions](#challenges-and-solutions)
- [Contributions](#contributions)
- [License](#license)

## Prerequisites

Before you begin, make sure you have the following software installed:

- Docker (Docker Desktop)
- Kubernetes (Minikube, kubectl and Kubernetes enabled)
- Terraform
- Git

## Getting Started

Follow these steps to set up and run HelloWorldApp:

### 1. Clone the Repository

```sh
git clone <repository-url>
cd HelloWorldApp
```

### 2. Dockerize the Application
1. Build the Docker image:
```sh
docker build -t helloworld-app .
```
2. Tag the Docker image:
```sh
docker tag helloworld-app:latest <dockerhub-username>/helloworld-app:1.0
```

3. Log in to Docker Hub:
```
docker login
```

4. Push the Docker image to Docker Hub:
```
docker push <dockerhub-username>/helloworld-app:1.0
```

### 3. Kubernetes Setup
1. Setting Up a Kubernetes Cluster with Minikube
Here's how you can set it up:

- Install Minikube: Visit the Minikube page: https://minikube.sigs.k8s.io/docs/start/
Start Minikube:

- Open a terminal or command prompt.
Run the following command to start Minikube:
```sh
minikube start
```
Minikube will create a virtual machine and set up a Kubernetes cluster inside it.

### 4. Deploy with Terraform
Deploy the application using Terraform:
```sh
terraform init
terraform plan
terraform apply
```

### 5. Set Up ActiveMQ
1. Install and Configure ActiveMQ:
After download ActiveMQ, navigate to the activemq/bin directory and run:
```sh
activemq start
```
2. Open the given url. e.g: http://127.0.0.1:8161/
User and password: admin

3. Create a queue named "app-queue"

### 6. Set Up ActiveMQ

1. Access Through Kubernetes: Once deployed, you can access your application through Kubernetes. Run the following command to get the URL:
```sh
minikube service helloworld-service
```

This command will open your default web browser and navigate to the URL of your deployed application.
Open your browser with the url provided to access the ActiveMQ web UI.

## Cleanup
To clean up and remove deployed resources, run:
```sh
terraform destroy
minikube delete
```

## Approach
The approach taken for this project involves:

1. Containerization with Docker: The "Hello World" application is containerized using Docker, ensuring its portability across different environments.

2. Kubernetes Deployment with Terraform: Kubernetes resources (namespace, deployment, service, and ingress) are defined and managed using Terraform, simplifying deployment and management.

3. Integration with ActiveMQ: ActiveMQ is set up and integrated with the application for message queuing, enhancing communication and data processing.

## Challenges and Solutions
Throughout development, I've encountered and overcome various challenges:

1. Java Version Compatibility: ActiveMQ integration required specific Java version compatibility. We ensured the correct Java version was configured for ActiveMQ.

2. Networking and Connectivity: Establishing communication between the application, Kubernetes, and ActiveMQ involved configuring network settings and endpoints.

3. Terraform Configuration: Proper parameterization and understanding of Kubernetes object definitions were crucial for configuring resources with Terraform.

## Contributions
Contributions are welcome! If you encounter issues or have suggestions for improvements, please submit a pull request.

## License
This project is licensed under the MIT License.
