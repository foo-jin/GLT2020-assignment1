module ccl::Tests


import ccl::Parser;
import ccl::CST2AST;
import ccl::Check;
import IO;


void main() {
	r = parserCCL(|project://glt2020-ccl/testfiles/test-uniquelable.ccl|);
	ast = cst2ast(r);
	b = uniqueLabels(ast);
	println("unique labels: <b>");
}