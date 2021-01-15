# readme
# 	https://docs.cloud.oracle.com/en-us/iaas/Content/Functions/Tasks/functionsinvokingfunctions.htm#ocicurlinvoke
source /home/opc/oci-curl/oci-curl.sh

# fn inspect f myapp my-func

oci-curl epdga5vg6va.us-ashburn-1.functions.oci.oraclecloud.com post empty.json /20181201/functions/ocid1.fnfunc.oc1.iad.aaaaaaaaacuhpik6ggyuiulrc4fijyv675hjm7wrg3qnflbncbbipno5j52q/actions/invoke

