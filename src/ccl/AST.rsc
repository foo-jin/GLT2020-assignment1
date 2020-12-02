module ccl::AST

/*
 * Define Abstract Syntax for CCL
 *
 * - make sure there is an almost one-to-one correspondence with the grammar (Syntax.rsc)
 */
 data Prog = prog(list[Resource] resources);
 
 data Resource = resource(str Id, list[Instance] instances);
 
 data Instance
 	= storage(str Id, list[Property])
 	| computing(str Id, list[Property])
 	| ref(str Id);
 	
data Property
	= region(Region r)
	| os(OS os)
	| engine(Engine e)
	| cpu(int cores)
	| memory(int mem)
	| ipv6(IPV6 yn)
	| storage(StorageKind s, int amount);
	
data IPV6
	= yes()
	| no();

 data StorageKind
	= bls()
	| ssd();
 
 data Engine
 	= mySQL()
 	| postgreSQL()
	| mariaDB()
	| oracle()
	| sqlServer();

data OS 
	= linux()
	| rhe()
	| ubuntu()
	| windows();
	
data Region
	= california()
	| capeTown()
	| frankfurt()
	| bogota()
	| seoul();