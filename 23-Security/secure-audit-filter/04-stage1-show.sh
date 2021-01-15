echo "
At this point, the database is setup up with
1. The MySQL DB initialization 
	- no test database
	- root user is only created for local access
	- root user is created with random password
	- SSL certificate created on MySQL Server Data Directory

2. MySQL Configuration File with
	secure_file_priv=NULL

3. Using mysql_config_editor to create a login-path for testroot
	the password is no longer required for backed program.
	However, the OS user's privileged must be secured properly

"
	
