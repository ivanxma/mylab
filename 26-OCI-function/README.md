A good post : https://recursive.codes/blog/post/1167

1. Create compartment for testing

2. Create required network for access (VCN and subnets)

3. For Mac Users 

a. Assuming docker is running   (and running with ashburn-1) and (OCI Profile using DEFAULT)
	docker-machine start
	eval $(docker-machine env)
b. brew install fn

4. For OCI registry
	make sure you have the api token
	make sure create repository for FaaS
		[repo-name-prefix]

5. docker login iad.ocir.io

```
fn create context myoci --provider oracle
fn update context oracle.compartment-id <compartment-id>
fn update context api-url https://functions.us-ashburn-1.oraclecloud.com
fn update context registry iad.ocir.io/idazzjlcjqzj/[repo-name-prefix]
fn update context oracle.profile DEFAULT  
fn create app faas-demo
fn init --runtime node faas-demo-func-1
fn deploy --app faas-demo
fn invoke faas-demo faas-demo-func-1
```



	
