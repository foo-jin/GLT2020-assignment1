module ccl::AST

/*
 * Define Abstract Syntax for CCL
 *
 * - make sure there is an almost one-to-one correspondence with the grammar (Syntax.rsc)
 */
 data Prog = prog(list[Resource] resources);
 
 data Resource = resource(str Id, list[Instance] instances);
 
 data Instance
 	= storage(list[Property])
 	| computing(list[Property])
 	| ref(str Id);
 	
data Property
	= region(Region)
	| os(OS)
	| engine(Engine)
	| cpu(int cores)
	| memory(int mem)
	| ipv6(bool)
	| storage(StorageKind, int amount);
	
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