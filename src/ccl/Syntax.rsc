module ccl::Syntax

/*
 * Define concrete syntax for CCL. The language's specification is available in the PDF (Section 3)
*/

/*
 * Concrete syntax defined. A few aspects were unclear:
 * - Can there be multiple instances of properties? We assumed no, 
 * so we enforced a specific order. TODO: improve this
 */
 
 //not needed perse but maybe more elegant?
start syntax Program = prog: {Resource ","}*;

syntax Resource = resource: "resource" Id "{" {Instance ","}* "}";


syntax Instance
	= computing: "computing" Id Props
	| storage: "storage" Id Props
	| ref: Id;
	
syntax Props = "{" {Property ","}* "}";
	
syntax Property
	= region: "region:" Region
	| os: "OS:" OS
	| engine: "engine:" Engine
	| cpu: "CPU:" CPU
	| memory: "memory:" Memory
	| ipv6: "IPV6:" IPV6
	| storage: "storage:" StorageKind "of" Numeral "GB";

syntax IPV6 
	= yes: "yes"
	| no: "no";

syntax StorageKind 
	= bls: "BLS"
	| ssd: "SSD";

syntax Memory = Numeral "GB";

syntax CPU = Numeral "cores";

syntax Engine
	= mySQL: "MySQL"
	| postgreSQL: "PostgreSQL"
	| mariaDB: "MariaDB"
	| oracle: "Oracle"
	| sqlServer: "SQL Server";

syntax OS 
	= linux: "Linux"
	| rhe: "Red Hat Enterprise"
	| ubuntu: "Ubuntu Server"
	| windows: "Windows Server 2019";
	
syntax Region
	= california: "California"
	| capeTown: "Cape Town"
	| frankfurt: "Frankfurt"
	| bogota: "Bogota"
	| seoul: "Seoul";
	
lexical Numeral = [0-9]+;

lexical Id = [A-Za-z][A-Za-z0-9_]*;

layout Whitespace = [\ \t\n\r]*;