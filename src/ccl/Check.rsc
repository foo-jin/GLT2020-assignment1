module ccl::Check

import ccl::AST;
import Map;
import Set;

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
bool checkCloudConfiguration(Prog p) {
	return uniqueLabels(p) && validStorageSize(p)
		&& validMemSize(p) && validRegion(p) && validEngine(p)
		&& sameRegionInResource(p) && noDuplicates(p);
}

 
/*
* Define a function per each verification defined in the PDF (Section 3.2.)
*/
bool uniqueLabels(Prog p) {
	for (resrc <- p.resources) {
		map[str, int] counters = ();
		for (/storage(str id, _) <- resrc) {
			if (id in counters) counters[id] += 1;
			else counters[id] = 1;
		};
		
		for (/computing(str id, _) <- resrc) {
			if (id in counters) counters[id] += 1;
			else counters[id] = 1;
		};
		
		if (!all(pair <- range(counters), pair <= 1)) return false;
	}
	return true;
}

bool validStorageSize(Prog p) {
	for (/storage(_, int size) <- p) if (size <= 0 || size > 1000)
		return false;
	return true;
}


bool validMemSize(Prog p) {
	for (/memory(int mem) <- p) if (mem < 0 || mem > 64)
		return false;
	return true;
}

// This check is obsolete because region correctness
// is enforced in the syntax
bool validRegion(Prog p) {
	return true;
}


// See comment of `validRegion`
bool validEngine(Prog p) {
	return true;
}


bool sameRegionInResource(Prog p) {
	for (resrc <- p.resources) {
		set[Region] seen = {};
		for (/region(r) <- resrc) seen += r;
		if (size(seen) > 1) return false;
	} 
	return true;
}


// we interpret this requirement as:
// 'no duplicate MIs _within a resource_',
// so we do not check cross-resource duplicates.
bool noDuplicates(Prog p) {
	for (resrc <- p.resources) {
		for (/Instance::storage(id, props) <- resrc) {
			for (/Instance::storage(id2, props2) <- resrc) {
				if (id != id2 && props == props2) {
					return false;
				};
			};
		};
		
		for (/computing(id, props) <- resrc) {
			for (/computing(id2, props2) <- resrc) {
				if (id != id2 && props == props2) return false;
			};
		};
	};
	
	return true;
}
