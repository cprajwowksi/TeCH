# docker build -t cprajwowski/lab10-zad2-mikroserwis_b ./mikroserwis_b/.
# docker build -t cprajwowski/lab10-zad2-mikroserwis_a ./mikroserwis_a/.
# docker push cprajwowski/lab10-zad2-mikroserwis_a
# docker push cprajwowski/lab10-zad2-mikroserwis_b

kubectl apply -f my-mikroserwis_a_deployment.yaml
kubectl apply -f my-mikroserwis_b_deployment.yaml
kubectl apply -f my-mongo-pv.yaml
kubectl apply -f my-mongo-pvc.yaml
kubectl apply -f my-mongo-pod.yaml