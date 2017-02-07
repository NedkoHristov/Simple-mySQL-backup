#!/bin/bash

#mySQL username
USER="root"

#mySQL password
PASSWORD="your-password-here"

#Backup directory
DIR="/var/www/backup/DB/"

#Backup name (in this case will be sql_20170207)
OUTPUT="$DIR""sql_`date +%Y%m%d`"

#Create directory
mkdir $OUTPUT

#Show all databases
databases=`mysql -u $USER -p$PASSWORD -e "SHOW DATABASES;" | tr -d "| " | grep -v Database`

for db in $databases; do

# Exclude information_schema and performance_schema. mysql databases will stay, because there's all mySQL users.
        if [[ "$db" != "information_schema" ]] && [[ "$db" != "performance_schema" ]] && [[ "$db" != _* ]] ; then
        echo "Dumping database: $db"

#Dump all databases. In this example the name will be 20170207.(databaase_name).sql
        mysqldump -u $USER -p$PASSWORD --databases $db > $OUTPUT/`date +%Y%m%d`.$db.sql

#Using gzip the SQL files will be archived with next options:
#-f - will overwrite if therе's any file with the same name
#-v verbose output

        gzip -f -v $OUTPUT/`date +%Y%m%d`.$db.sql

        fi
done

#Enjoy