if (sys.argv.length == 1  || sys.argv[1] == "3310" ) {
	print("Starting 3310...\n");
	dba.startSandboxInstance(3310, {sandboxDir:"/home/mysql/data/sandbox"});
}
if (sys.argv.length == 1  || sys.argv[1] == "3320" ) {
	print("Starting 3320...\n");
	dba.startSandboxInstance(3320, {sandboxDir:"/home/mysql/data/sandbox"});
}
if (sys.argv.length == 1  || sys.argv[1] == "3330" ) {
	print("Starting 3330...\n");
	dba.startSandboxInstance(3330, {sandboxDir:"/home/mysql/data/sandbox"});
}

