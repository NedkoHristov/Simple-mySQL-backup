# Simple-mySQL-backup
Simple mySQL backup script what exports databases on a separate files.

Simple mySQL backup tool is written on BASH and allows user to make a backup in a separate file for each database.


# Usage

The script can be used as single time backup solution or can be used in cronjob.
* TODO - add cronjob usage section


# Instalation / running

Running the script is quite easy. First of all we need to take the project to any directory on our server (I choose /opt)

```
git clone https://github.com/NedkoHristov/Simple-mySQL-backup/ /opt/Simple-mySQL-backup

```

Open the file mysql_backup.sh with your favorite editor and fill-up next data:
USER="your-mysql-username"
PASSWORD="your-mysql-password"
DIR="dump-directory"

Note - $DIR should follows to directory with appropriate read/write permissions.
