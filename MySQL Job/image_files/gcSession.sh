!#/bin/bash
VARHOST=$1
VARUSR=$2
VARPWD=$3
mysql -h $VARHOST -u $VARUSR -p$VARPWD < /opt/tbl_sensor.sql
#mysql -h mysql-service -u root -pPhilipp1 testdb < /opt/tbl_sensor.sql

