. ./comm.sh
mysql -t -uroot -h127.0.0.1 -e "use ndbinfo;select node_id, param_name, config_value, param_default, param_max from config_values, config_params where config_values.config_param = config_params.param_number order by 1, 2;"
