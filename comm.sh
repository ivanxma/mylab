export MYSQL_HOME=/usr/local/mysql
export SHELL_HOME=/usr/local/shell
export ROUTER=/usr/local/router
export PATH=$MYSQL_HOME/bin:$SHELL_HOME/bin:$ROUTER/bin:$PATH
export LD_LIBRARY_PATH=$ROUTER/lib:$ROUTER/lib/mysqlrouter:$LD_LIBRARY_PATH

export BRIDGE_HOST=ivanma-demo2
export BRIDGE_CHANNEL=channel1
export BRIDGE_DRCHANNEL=drchannel1
export CLUSTER_HOST=ivanma-demo1
export CLUSTER_IPALLOWLIST=10.0.0.0/16
export SECONDARY_HOST=ivanma-demo3

if [ ! -r config/gencnf.touch ]
then
  for i in `ls -1 config/template/*.cnf`
  do
    CNF=`basename $i`
    sed '1,$s/\$BRIDGE_HOST/'"$BRIDGE_HOST"'/g; 1,$s/\$BRIDGE_CHANNEL/'"$BRIDGE_CHANNEL"'/g; 1,$s/\$BRIDGE_DRCHANNEL/'"$BRIDGE_DRCHANNEL"'/g; 1,$s/\$CLUSTER_HOST/'"$CLUSTER_HOST"'/g; 1,$s/\$SECONDARY_HOST/'"$SECONDARY_HOST"'/g;' config/template/$CNF > config/$CNF
  done

    touch config/gencnf.touch
fi
	
