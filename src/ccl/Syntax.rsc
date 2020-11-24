module ccl::Syntax

/*
 * Define concrete syntax for CCL. The language's specification is available in the PDF (Section 3)
*/

/*
 * Concrete syntax defined. A few aspects were unclear:
 * - Can there be multiple instances of properties? We assumed no, 
 * so we enforced a specific order. TODO: improve this
 */

syntax Resource = "resource" Id "{" ComputingOrStorage+ "}";

syntax ComputingOrStorage = Computing | Storage | Id;

syntax ComputingInstance
	= "computing" Id "{" "region:" Region "," "OS:" OS ","
	"CPU:" CPU "," "memory:" Memory "," "IPV6:" IPV6 "," "storage:" storage
	"}";

syntax StorageInstance
	= "storage" Id "{" "region:" Region "," "engine:" Engine ","
	"CPU:" CPU "," "memory:" Memory "," "IPV6:" IPV6 "," "storage:" storage
	"}";

syntax IPV6 = "yes" | "no";

syntax Storage = StorageType "of" Numeral "GB";

syntax StorageType 
	= "BLS"
	| "SSD";

syntax Memory = Numeral "GB";

syntax CPU = Numeral "cores";

syntax Engine
	= "MySQL"
	| "PostgreSQL"
	| "MariaDB"
	| "Oracle"
	| "SQL Server";

syntax OS 
	= "Linux"
	| "Red Hat Enterprise"
	| "Ubuntu Server"
	| "Windows Server 2019";
	
syntax Region
	= "California"
	| "Cape Town"
	| "Frankfurt"
	| "Bogota"
	| "Seoul";
	
lexical Numeral = [0-9]+;

lexical Id = [A-Za-z][A-Za-z0-9_]*;

layout Whitespace = [\ \t\n\r]*;