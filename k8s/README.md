# Yolo-App Deployment with Kubernetes

This project demonstrates the deployment of a multi-component application using Kubernetes. The application consists of a frontend, backend, MongoDB database, and Mongo Express for database management.

## Prerequisites

- Make sure [Kubernetes](https://kubernetes.io/) is installed
- Make sure [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) is configured
- Make sure the [AWSCLI](https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip) is installed and configured together with [eksctl](https://github.com/weaveworks/eksctl/releases/latest/download/eksctl)

**Steps to download AWS CLI on Linux**
```markdown
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version
```
**Steps to download eksctl on Linux**
```markdown
curl --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" -o "eksctl.tar.gz"
tar -xzf eksctl.tar.gz
sudo mv eksctl /usr/local/bin
eksctl version

```

## Deployment steps

1. **Apply MongoDB resources**:
``` markdown 
kubectl apply -f mongodb-statefulset.yml 
kubectl apply -f mongodb-service.yml 
```

2. **Apply Backend resources**:
``` markdown 
kubectl apply -f backend-deployment.yml
kubectl apply -f backend-service.yml
```

3. **Apply Frontend resources**:
``` markdown 
kubectl apply -f frontend-deployment.yml
kubectl apply -f frontend-service.yml
```

4. **Apply Mongo-Express resources**:
``` markdown 
 kubectl apply -f mongo-express-deployment.yml
 kubectl apply -f mongo-express-service.yml
```
5. **Apply Persistent Volume (pv) resources**:
``` markdown
kubectl apply -f pv.yml
```

6. **Apply Persistent Volume Claim (pvc)**:
```markdown
kubectl apply -f pvc.yml
```
## Reason for multiple cofiguration files for each servic
- **Modularity:** Separate YAML files make it easier to manage and maintain individual components. Each file focuses on a specific part of the application (e.g., frontend, backend, database).

- **Scalability:** With separate YAML files, each service can be scaled independently. For instance, if the backend requires more resources, we can scale it without affecting the frontend or the database.

- **Isolation:** Isolating configurations reduces the risk of errors. Changes to one service's configuration won't inadvertently affect another service.

- **Reusability:** Separate YAML files can be reused across different environments (e.g., development, staging, production) with minimal changes.



## Access the application
- Frontend: [Yolo-app](http://a2cd55b4cfb6d46a2a7f253d8c7476d8-530763216.us-west-2.elb.amazonaws.com/)
- Mongo Express: [Yolodb](http://aa9b277be2dd64233912349a23347468-1407590778.us-west-2.elb.amazonaws.com)
