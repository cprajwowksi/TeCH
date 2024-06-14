kubectl apply -f mongodb-pv-pvc.yaml
kubectl apply -f my-database_a_pod.yaml 
kubectl apply -f my-mikroserwis_a_deployment.yaml
kubectl apply -f my-mikroserwis_b_deployment.yaml
kubectl rollout restart deployment mikroserwis-a
kubectl rollout restart deployment mikroserwis-b
