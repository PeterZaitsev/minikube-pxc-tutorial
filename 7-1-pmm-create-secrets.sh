 kubectl patch secret/minimal-cluster-secrets -p '{"data":{"pmmserverkey": "'$(echo -n eyJrIjoiNkpiZnlCczluT2tsU1REVjdHUnhxVE9RTFdBN2o5SkYiLCJuIjoia3ViZSIsImlkIjoxfQ== | base64 -w0)'"}}'

