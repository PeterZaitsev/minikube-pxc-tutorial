mysql -e "create database sbtest"
sysbench --db-driver=mysql --threads=4 --mysql-host=$MYSQL_HOST --mysql-port=$MYSQL_TCP_PORT --mysql-user=root --mysql-password=$MYSQL_PWD --mysql-db=sbtest /usr/share/sysbench/oltp_point_select.lua --report-interval=1 --table-size=1000000 prepare
