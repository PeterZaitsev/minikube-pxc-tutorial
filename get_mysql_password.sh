export MYSQL_PASSWORD=`kubectl get secrets minimal-cluster-secrets  -ojson | jq -r .data.root | base64 -d`

