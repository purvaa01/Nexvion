# Nexvion Cloud Deployment

## Overview

Nexvion was deployed to AWS using Amazon EC2 and K3s Kubernetes.

## Architecture

GitHub → Jenkins → Docker → Docker Hub → AWS EC2 → K3s → Nexvion

## AWS Environment

- Cloud Provider: AWS
- Region: ap-south-1 (Mumbai)
- Compute: Amazon EC2
- OS: Ubuntu 24.04
- Instance Type: t3.small
- Kubernetes: K3s

## Kubernetes Deployment

Nexvion was deployed to the K3s cluster using the Docker image:

`purvaawankhede/nexvion:latest`

Deployment details:

- Namespace: `nexvion`
- Replicas: 2
- Service: `nexvion-service`
- Service Type: NodePort
- Application Port: 80
- NodePort: 31957

Both application pods reached the `Running` state and the K3s node reached the `Ready` state.

## Verification

The Nexvion application was successfully accessed through the EC2 public IP and Kubernetes NodePort from a web browser.

This verified the cloud deployment of the application on AWS.
