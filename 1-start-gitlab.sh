nerdctl -n k8s.io pull nginx:1.23.1-alpine
kubectl apply -f ./gitlab/gitlab-namespace.yaml
sleep 2
kubectl apply -f gitlab
