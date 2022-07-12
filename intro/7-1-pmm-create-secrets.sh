 kubectl patch secret/minimal-cluster-secrets -p '{"data":{"pmmserverkey": "'$(echo -n $PMM_API_KEY | base64 -w0)'"}}'

