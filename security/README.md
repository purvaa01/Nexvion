# Nexvion Security

## Security Checks

Nexvion includes security checks as part of the CI/CD pipeline.

### Filesystem Security Scan

Trivy scans the project filesystem for:

- Vulnerabilities
- Secrets

The pipeline checks HIGH and CRITICAL severity findings.

### Container Image Security Scan

After the Docker image is built, Trivy scans the container image for HIGH and CRITICAL vulnerabilities.

### Kubernetes Secret Management

Application-sensitive configuration is stored using a Kubernetes Secret resource rather than directly in the application deployment configuration.

## Security Flow

GitHub
→ Jenkins
→ Trivy Filesystem Scan
→ Docker Build
→ Trivy Image Scan
→ Deployment

Security checks are performed before deployment.
