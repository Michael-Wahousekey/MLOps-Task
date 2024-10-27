# Docker
docker build -t randomforest .
docker run --rm -v "$(pwd):/app" randomforest

docker login
docker tag randomforest wohousekey/randomforest:latest
docker push wohousekey/randomforest:latest

# Kubernetes
<!-- Download metrics -->
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

<!-- Delete all -->
kubectl delete all -all

# Improvements to be made:
1. Add the code below for github's action runner instead of self hosting
```yaml
- name: Log in to Docker Hub
  env:
    DOCKER_USERNAME: ${{ secrets.DOCKER_USERNAME }}  # Add this secret in GitHub
    DOCKER_TOKEN: ${{ secrets.DOCKER_TOKEN }}        # Add this secret in GitHub
  run: |
    echo "${{ secrets.DOCKER_TOKEN }}" | docker login -u "${{ secrets.DOCKER_USERNAME }}" --password-stdin
```
2. Within CI/CD, replace all kubernetes local functions to GKE
    - Why didn't i do it in a GKE? Simple, i'm a bit cautious in the worst case i burn off the credit and paid off from my card. Nevertheless, its just a matter of migrating it to a cloud service
3. Exposing service by using a load balancer to get an external ip which makes it accessible outside the cluster