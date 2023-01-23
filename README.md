# MariaDB-Scripts
Just some handy scripts


This script is a bash script that uses the mariabackup command to create backups of a MariaDB or MySQL database. The script reads in configuration options from a file called "backup.conf" using the "source" command.

The script starts by setting the current date and the current day of the week using the "date" command. Then, it uses a while loop to check for command line arguments passed to the script. The possible arguments include "-b" or "--backup-dir" to specify the directory where backups should be stored, "-c" or "--compressed-backup-dir" to specify the directory where compressed backups should be stored, "-u" or "--user" to specify the username to connect to the database, "-p" or "--password" to specify the password to connect to the database, "-d" or "--databases" to specify which databases to backup, "-r" or "--retention-days" to specify how many days to retain backups for before deleting them, and "-h" or "--help" to display usage information for the script.

The script then enters a loop to iterate through each of the databases specified in the "-d" or "--databases" argument. Inside the loop, the script checks whether the current day of the week is Sunday (0) or whether the "-f" or "--force-full" argument has been passed. If either of these conditions is true, the script creates a full backup of the current database using the mariabackup command. The filename for the backup is set using the current date and the name of the database. The script then compresses the backup file using the gzip command, and logs the information about the backup to a file called "backup.log" in the backup directory. The script then deletes any backup files older than the number of days specified in the "-r" or "--retention-days" argument.

If the current day of the week is not Sunday or the "-f" or "--force-full" argument has not been passed, the script checks whether the current day of the week is between Monday and Friday or whether the "-i" or "--force-inc" argument has been passed. If either of these conditions is true, the script creates an incremental backup of the current database using the mariabackup command. The script uses the find command to find the latest backup file and sets it as the base for the incremental backup. The filename for the backup is set using the current date and the name of the database. The script then compresses the backup file using the gzip command, and logs the information about the backup to a file called "backup.log" in the backup directory. The script then deletes any backup files older than the number of days specified in the "-r" or "--retention-days" argument.
