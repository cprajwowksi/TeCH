kubectl delete deployment my-mongo-pod
kubectl delete pvc my-mongo-pvc
kubectl apply -f my-mikroserwis_a_deployment.yaml
kubectl apply -f my-mikroserwis_b_deployment.yaml
kubectl apply -f my-mongo-pv.yaml
kubectl apply -f my-mongo-pvc.yaml
kubectl apply -f my-mongo-secret.yaml
kubectl apply -f my-mongo-pod.yaml
