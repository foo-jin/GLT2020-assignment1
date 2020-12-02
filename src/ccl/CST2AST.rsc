module ccl::CST2AST

import ccl::AST;
import ccl::Syntax;
import ParseTree;

/*
 * -Implement a mapping from concrete syntax trees (CSTs) to abstract syntax trees (ASTs)
 * - Hint: Use switch to do case distinction with concrete patterns 
 * - Map regular CST arguments (e.g., *, +, ?) to lists 
 * - Map lexical nodes to Rascal primitive types (bool, int, str)
 */
 
Prog implode(p) = implode(#Prog, p);
 
Prog cst2ast(Program p) = implode(p);