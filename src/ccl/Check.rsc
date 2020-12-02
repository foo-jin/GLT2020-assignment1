module ccl::Check

import ccl::AST;
import Map;

/*
 * -Implement a well-formedness checker for the CCL language. For this you must use the AST. 
 * - Hint: Map regular CST arguments (e.g., *, +, ?) to lists 
 * - Hint: Map lexical nodes to Rascal primitive types (bool, int, str)
 * - Hint: Use switch to do case distinction with concrete patterns
 */

 /*
 * Create a function called checkCloudConfiguration(...), which is responsible for calling all the required functions that check the program's well-formedness as described in the PDF (Section 3.2.) 
 * This function takes as a parameter the program's AST and returns true if the program is well-formed or false otherwise.
 */
 
/*
* Define a function per each verification defined in the PDF (Section 3.2.)
*/


bool uniqueLabels(Prog p) {
	map[str, int] counters = ();
	for (/storage(str id, _) <- p) {
		if (id in counters) counters[id] += 1;
		else counters[id] = 1;
	};
	
	for (/computing(str id, _) <- p) {
		if (id in counters) counters[id] += 1;
		else counters[id] = 1;
	};
	
	if (!all(pair <- range(counters), pair <= 1)) return false;
	else return true;
}

bool validStorageSize(Prog p) {
	for (/storage(_, int size) <- p) if (size < 0 || size > 1000)
		return false;
	return true;
}


bool validMemSize(Prog p) {
	for (/memory(int mem) <- p) if (mem < 0 || mem > 64)
		return false;
	return true;
}