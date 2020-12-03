module ccl::Tests


import ccl::Parser;
import ccl::CST2AST;
import ccl::Check;
import IO;


void main() {
	println("correct tests");
	r = parserCCL(|project://glt2020-ccl/testfiles/test-correct.ccl|);
	ast = cst2ast(r);
	b = checkCloudConfiguration(ast);
	println("checks: <b>");
	
	r = parserCCL(|project://glt2020-ccl/testfiles/test-multiple.ccl|);
	ast = cst2ast(r);
	b = checkCloudConfiguration(ast);
	println("checks: <b>");

	println("`false` is expected for the rest these tests");
	
	// unique labels
	r = parserCCL(|project://glt2020-ccl/testfiles/test-uniquelabel.ccl|);
	ast = cst2ast(r);
	b = uniqueLabels(ast);
	println("unique labels: <b>");
	
	
	// storage size
	r = parserCCL(|project://glt2020-ccl/testfiles/test-storage1.ccl|);
	ast = cst2ast(r);
	b = validStorageSize(ast);
	println("valid storage 1: <b>");
	
	r = parserCCL(|project://glt2020-ccl/testfiles/test-storage2.ccl|);
	ast = cst2ast(r);
	b = validStorageSize(ast);
	println("valid storage 2: <b>");
	
	
	// memory size
	r = parserCCL(|project://glt2020-ccl/testfiles/test-memory.ccl|);
	ast = cst2ast(r);
	b = validMemSize(ast);
	println("valid memory: <b>");
	
	
	//// valid region (handled in parsing and thus cannot be tested here)
	
	
	//// engine (see comment valid region)
	
	
	// same region in resource
	r = parserCCL(|project://glt2020-ccl/testfiles/test-region3.ccl|);
	ast = cst2ast(r);
	b = sameRegionInResource(ast);
	println("same region in resource: <b>");
	
	
	// duplicates
	r = parserCCL(|project://glt2020-ccl/testfiles/test-duplicate.ccl|);
	ast = cst2ast(r);
	b = noDuplicates(ast);
	println("no duplicates: <b>");
	
}