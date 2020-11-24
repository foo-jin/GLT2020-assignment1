module ccl::AST

/*
 * Define Abstract Syntax for CCL
 *
 * - make sure there is an almost one-to-one correspondence with the grammar (Syntax.rsc)
 */
 data Resource = resource(str Id, list[Instance] instances);
 
 data Instance
 	= storage(Region reg, Engine eng, int cores,
 		int memory, bool IPV6, StorageType sType, int sQuantity)
 	| computing(Region reg, OS os, int cores,
 		int memory, bool IPV6, StorageType sType, int sQuantity);
 
 data StorageType 
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