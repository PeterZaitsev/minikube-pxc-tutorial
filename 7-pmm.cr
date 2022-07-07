apiVersion: pxc.percona.com/v1-11-0
kind: PerconaXtraDBCluster
metadata:
  name: minimal-cluster
  finalizers:
    - delete-pxc-pods-in-order
    - delete-pxc-pvc
spec:
  crVersion: 1.11.0
  secretsName: minimal-cluster-secrets
  allowUnsafeConfigurations: true
  pause: false 
  upgradeOptions:
    apply: 8.0-recommended
    schedule: "0 4 * * *"
  pxc:
    size: 3
    image: percona/percona-xtradb-cluster:8.0.27-18.1
    resources:
      requests:
        memory: 1G
        cpu: "1" 
      limits:
        memory: 2G
        cpu: "2"
    affinity:
      antiAffinityTopologyKey: "none"
    volumeSpec:
      persistentVolumeClaim:
        resources:
          requests:
            storage: 6G
  haproxy:
    enabled: true
    size: 1
    image: percona/percona-xtradb-cluster-operator:1.11.0-haproxy
    affinity:
      antiAffinityTopologyKey: "none"
  logcollector:
    enabled: true
    image: percona/percona-xtradb-cluster-operator:1.11.0-logcollector
  backup:
    image: percona/percona-xtradb-cluster-operator:1.11.0-pxc8.0-backup 
    storages:
      fs-pvc:
        type: filesystem
        volume:
          persistentVolumeClaim:
            accessModes: [ "ReadWriteOnce" ]
            resources:
              requests:
                storage: 6Gi
  pmm:
    enabled: true
    image: percona/pmm-client:2.28.0
    serverHost: 10.11.13.140
    resources:
      requests:
        memory: 150M
        cpu: 300m

