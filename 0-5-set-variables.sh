export MYSQL_HOST=$(kubectl get nodes -o jsonpath="{.items[0].status.addresses[0].address}")
echo MYSQL_HOST $MYSQL_HOST
export MYSQL_TCP_PORT=$(kubectl get services/mysql-test -o go-template='{{(index .spec.ports 0).nodePort}}')
echo  MYSQL_TCP_PORT $MYSQL_TCP_PORT
export MYSQL_PWD=`kubectl get secrets minimal-cluster-secrets  -ojson | jq -r .data.root | base64 -d`

