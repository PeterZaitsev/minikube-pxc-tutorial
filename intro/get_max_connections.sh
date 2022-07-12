mysql -h $NODE_IP  -P $MYSQL_PORT -uroot -p$MYSQL_PASSWORD -e "select @@max_connections"
