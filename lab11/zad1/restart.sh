docker build -t cprajwowski/lab10-zad3-mikroserwis_b ./mikroserwis_b/.
docker build -t cprajwowski/lab10-zad3-mikroserwis_a ./mikroserwis_a/.
docker push cprajwowski/lab10-zad3-mikroserwis_a
docker push cprajwowski/lab10-zad3-mikroserwis_b

kubectl scale deployment mikroserwis-a --replicas=0
kubectl scale deployment mikroserwis-a --replicas=3
kubectl scale deployment mikroserwis-b --replicas=0
kubectl scale deployment mikroserwis-b --replicas=1

