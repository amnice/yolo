# Explanation of Kubernetes Deployment for Yolo app

This document provides an explanation of the Kubernetes deployment for the yolo eommerce app with MongoDB using Minikube and AWS platform.

## Choice of Kubernetes Objects

- **Deployment**: We used deployments to define the desired state for the backend and frontend applications. Deployments manage ReplicaSets, ensuring that the specified number of pod replicas are running at all times.
- **Service**: We used Kubernetes Service objects to expose the backend, frontend, and MongoDB Express deployments to other components within the cluster, providing a stable endpoint for accessing the applications.
- **StatefulSet**: Used for deploying MongoDB, which is a stateful application. StatefulSets ensure stable network identities for MongoDB pods, enabling direct peer-to-peer communication and maintaining data consistency.

## Method for Exposing Pods to Internet Traffic

- The services for the backend, frontend, and MongoDB Express deployments are of type `LoadBalancer`, which exposes the services to the internet. This allows external access to the applications via the Minikube IP and the NodePort.

## Use of Persistent Storage

- Persistent storage is used for MongoDB data to ensure data persistence. Volumes are mounted to store MongoDB data across pod restarts, ensuring data integrity and availability. In this project we used PV and PVC to ensure that the MongoDB data persists beyond the lifecycle of individual pods. We set up the pv and pvc files seperately for easy debbuging incase of any issues

## Git Workflow

- The repository follows a typical Git workflow, with changes being made on feature branches and merged into the main branch via pull requests. Continuous integration (CI) tools can be integrated to automate testing and deployment processes.

## Docker Image Tag Naming Standards

- Docker images are tagged with version numbers (e.g., `1.0`) for version control and ease of identification. Semantic versioning principles can be followed to manage image versions effectively.
