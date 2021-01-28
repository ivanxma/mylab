. ./comm.sh
mysqld_safe --defaults-file=config/my1a.cnf &
mysqld_safe --defaults-file=config/my2a.cnf &
mysqld_safe --defaults-file=config/my3a.cnf &

