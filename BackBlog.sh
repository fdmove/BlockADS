#!/bin/sh
# START
v_date=`date '+%Y%m%d'`

DB_USER='root'
DB_PASS='DBPASS'
DB_NAME='DBNAME'
DB_HOST='127.0.0.1'

# 备份数据库
mysqldump -h ${DB_HOST} -u ${DB_USER} -p${DB_PASS} --databases ${DB_NAME} > /root/backup/Backup.myBlog.mysqldump.${v_date}.SQL

# 备份网站的文件
v_blog='dasmz.com'
cd /var/www/
tar -zcvf /root/backup/Backup.${v_blog}.${v_date}.tar.gz ${v_blog}


# 删除旧的备份
cd /root/backup
find . -name *.tar.gz -type f -ctime +90 -print | xargs rm 
find . -name *.SQL    -type f -ctime +90 -print | xargs rm

# END
