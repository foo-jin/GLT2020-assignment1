module ccl::Parser

import ParseTree;
import ccl::Syntax;
import IO;


 /*
 * Define the parser for the CCL language. The name of the function must be parseCCL. 
 * This function receives as parameter the path of the file to parse represented as a loc, and returns a parse tree that represents the parsed program.
 */
 
//Tree parserCCL(loc file) = parse(#Resource, readFile(file));
//Tree parserCCL(loc file) = parse(#start[Program], readFile(file));
//I think we need to use the bottom one, it does not give unknown errors in the console
Program parserCCL(loc file) = parse(#Resource, file);