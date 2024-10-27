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

etst
kubectl get pods

