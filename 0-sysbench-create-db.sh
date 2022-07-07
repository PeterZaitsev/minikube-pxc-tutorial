mysqladmin  -h $NODE_IP  -P $MYSQL_PORT -uroot -p$MYSQL_PASSWORD create sbtest
sysbench --db-driver=mysql --threads=4 --mysql-host=$NODE_IP --mysql-port=$MYSQL_PORT --mysql-user=root --mysql-password=$MYSQL_PASSWORD --mysql-db=sbtest /usr/share/sysbench/oltp_point_select.lua --report-interval=1 --table-size=1000000 prepare
