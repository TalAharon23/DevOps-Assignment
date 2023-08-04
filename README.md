# HelloWorldApp with Kubernetes and ActiveMQ

Welcome to HelloWorldApp! This project demonstrates how to containerize a simple "Hello World" application, deploy it to a Kubernetes cluster using Terraform, and integrate it with ActiveMQ for message queuing.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
  - [1. Clone the Repository](#1-clone-the-repository)
  - [2. Dockerize the Application](#2-dockerize-the-application)
  - [3. Kubernetes Setup](#3-kubernetes-setup)
  - [4. Deploy with Terraform](#4-deploy-with-terraform)
  - [5. Set Up ActiveMQ](#5-set-up-activemq)
  - [6. Integrate with ActiveMQ](#6-integrate-with-activemq)
  - [7. Access the Application](#7-access-the-application)
- [Cleanup](#cleanup)
- [Contributions](#contributions)
- [License](#license)
- [Approach](#approach)
- [Challenges and Solutions](#challenges-and-solutions)

## Prerequisites

Before you begin, make sure you have the following software installed:

- Docker
- Kubernetes (Minikube or Docker Desktop with Kubernetes enabled)
- Terraform
- Git

## Getting Started

Follow these steps to set up and run HelloWorldApp:

### 1. Clone the Repository

```bash
git clone <repository-url>
cd HelloWorldApp
```