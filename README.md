# Docker
docker build -t randomforest .
docker run --rm -v "$(pwd):/app" randomforest

docker login
docker tag randomforest wohousekey/randomforest:latest
docker push wohousekey/randomforest:latest

# Kubernetes
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

<!-- Create the jobs -->
kubectl apply -f kubernetes-job.yaml

<!-- Delete if you want to stop -->
kubectl delete job rf-hyperparameter-tuning

<!-- To get the jobs -->
kubectl get jobs

<!-- To get the pods -->
t
kubectl get pods
 
# Instead of Local using GKE
Add the code below for github's action runner instead of self hosting
```yaml
- name: Log in to Docker Hub
  env:
    DOCKER_USERNAME: ${{ secrets.DOCKER_USERNAME }}  # Add this secret in GitHub
    DOCKER_TOKEN: ${{ secrets.DOCKER_TOKEN }}        # Add this secret in GitHub
  run: |
    echo "${{ secrets.DOCKER_TOKEN }}" | docker login -u "${{ secrets.DOCKER_USERNAME }}" --password-stdin
```

Replace kubernetes deployments from local to GKE
```yaml
- name: Deploy to Kubernetes
  run: |
    kubectl apply -f kubernetes-job.yaml 
```