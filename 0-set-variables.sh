export NODE_IP=$(kubectl get nodes -o jsonpath="{.items[0].status.addresses[0].address}")
echo NODE_IP $NODE_IP
export MYSQL_PORT=$(kubectl get services/mysql-test -o go-template='{{(index .spec.ports 0).nodePort}}')
echo  MYSQL_PORT $MYSQL_PORT
export MYSQL_PASSWORD=`kubectl get secrets minimal-cluster-secrets  -ojson | jq -r .data.root | base64 -d`

