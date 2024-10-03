. ./comm.sh
OPTION=group_replication_start_on_boot

change_gr_boot_option()
{
  if [ $# -ne 2 ]
  then
    echo "Invalid # of options"
    return 1
  fi
  
  MYFILE=$1
  VALUE=$2
  DD=`grep ^datadir ${MYFILE}|cut -f2 -d=`
  
  ./change-static-mysqld-auto.sh  ${DD}/mysqld-auto.cnf ${OPTION} ${VALUE}
  return 0
}


if [ $# -eq 0 ]
then
#	change_gr_boot_option config/my1.cnf OFF
#	change_gr_boot_option config/my2.cnf OFF
#	change_gr_boot_option config/my3.cnf OFF

	mysqld_safe --defaults-file=config/my1.cnf &
	mysqld_safe --defaults-file=config/my2.cnf &
	mysqld_safe --defaults-file=config/my3.cnf &
else
	change_gr_boot_option config/my${1}.cnf OFF
	mysqld_safe --defaults-file=config/my${1}.cnf &
fi
