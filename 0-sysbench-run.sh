sysbench --db-driver=mysql --threads=8 --mysql-host=$NODE_IP --mysql-port=$MYSQL_PORT --mysql-user=root --mysql-password=$MYSQL_PASSWORD --mysql-db=sbtest /usr/share/sysbench/oltp_point_select.lua --report-interval=1 --table-size=1000000 --report-interval=1 --time=60 run