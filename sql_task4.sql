TASK-4:
A complete demonstration of how to back up and restore a database with:

Deliverables
1.	Backup script
2.	Recovery (restore) script
3.	Documentation of the process
4.	Works for MySQL and PostgreSQL (both included)
5.	Realistic example based on a sample database

PART 1: BACKUP PROCESS

A. MySQL Backup Script
USER="root"
PASSWORD="your_password"
DATABASE="college_db"
BACKUP_DIR="/backups/mysql"
DATE=$(date +%F)

# Create backup directory if not exists
mkdir -p $BACKUP_DIR

# Backup command
mysqldump -u $USER -p$PASSWORD $DATABASE > $BACKUP_DIR/${DATABASE}_backup_$DATE.sql

echo "MySQL Backup completed: ${BACKUP_DIR}/${DATABASE}_backup_$DATE.sql"

 B. PostgreSQL Backup Script
USER="postgres"
DATABASE="college_db"
BACKUP_DIR="/backups/postgres"
DATE=$(date +%F)

# Create backup directory
mkdir -p $BACKUP_DIR

# Backup command
pg_dump -U $USER -F c -b -v -f $BACKUP_DIR/${DATABASE}_backup_$DATE.dump $DATABASE

echo "PostgreSQL Backup completed: ${BACKUP_DIR}/${DATABASE}_backup_$DATE.dump"

PART 2: RESTORE (RECOVERY) PROCESS:

A. MySQL Restore Script:
# MySQL credentials
USER="root"
PASSWORD="your_password"
DATABASE="college_db"
BACKUP_FILE="/backups/mysql/college_db_backup_2025-08-08.sql"

# Drop and recreate database
mysql -u $USER -p$PASSWORD -e "DROP DATABASE IF EXISTS $DATABASE; CREATE DATABASE $DATABASE;"

# Restore command
mysql -u $USER -p$PASSWORD $DATABASE < $BACKUP_FILE

B. PostgreSQL Restore Script:
USER="postgres"
DATABASE="college_db"
BACKUP_FILE="/backups/postgres/college_db_backup_2025-08-08.dump"

# Drop existing DB and recreate it
psql -U $USER -c "DROP DATABASE IF EXISTS $DATABASE;"
psql -U $USER -c "CREATE DATABASE $DATABASE;"

# Restore using pg_restore
pg_restore -U $USER -d $DATABASE -v $BACKUP_FILE

PART 3: DOCUMENTATION OF THE PROCESS

Backup & Recovery Documentation
A.Purpose:
Ensure data is protected and recoverable in case of server crashes, user errors, or hardware failure.

B.Backup Steps:
1.	Choose the target DB (college_db)
2.	Use:
o	mysqldump for MySQL
o	pg_dump for PostgreSQL
3.	Store backups in /backups/{mysql|postgres}
4.	Use filenames with timestamps for versioning

C.Recovery Steps:
1.	Drop and recreate the database
2.	Run the corresponding restore command
3.	Validate by checking table count and row data

D. Validation:
After restore:
-- Check row count
SELECT COUNT(*) FROM students;
-- Check table existence
SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';

E.Recommended Automation:
Use cron for automatic daily backups:
# Edit crontab
crontab -e
# Add daily backup at 1 AM
0 1 * * * /path/to/mysql_backup.sh




