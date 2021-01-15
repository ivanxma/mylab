
if ( sys.argv.length == 1 || sys.argv[1] == "3310" )
{
	print("Stopping 3310\n");
	dba.stopSandboxInstance(3310, {sandboxDir:"/home/mysql/data/sandbox",password:"welcome1"});
}
if ( sys.argv.length == 1 || sys.argv[1] == "3320" )
{
	print("Stopping 3320\n");
	dba.stopSandboxInstance(3320, {sandboxDir:"/home/mysql/data/sandbox",password:"welcome1"});
}
if ( sys.argv.length == 1 || sys.argv[1] == "3330" )
{
	print("Stopping 3330\n");
	dba.stopSandboxInstance(3330, {sandboxDir:"/home/mysql/data/sandbox",password:"welcome1"});
}
