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
 
Prog cst2ast(Program p) {
	p2 = implode(p);
	// strip the AST of the location information
	p3 = visit (p2) {
		case Property::region(a) => Property::region(a)
		case Property::os(a) => Property::os(a)
		case Property::engine(a) => Property::engine(a)
		case Property::cpu(a) => Property::cpu(a)
		case Property::memory(a) => Property::memory(a)
		case Property::ipv6(a) => Property::ipv6(a)
		case Property::storage(a, b) => Property::storage(a, b)
		
		case IPV6::yes() => IPV6::yes()
		case IPV6::no() => IPV6::no()
		
		case StorageKind::bls() => StorageKind::bls()
		case StorageKind::ssd() => StorageKind::ssd()
		
		case Engine::mySQL() => Engine::mySQL()
		case Engine::postgreSQL() => postgreSQL()
		case Engine::mariaDB() => Engine::mariaDB()
		case Engine::oracle() => Engine::oracle()
		case Engine::sqlServer() => Engine::sqlServer()
		
		case OS::linux() => OS::linux()
		case OS::rhe() => OS::rhe()
		case OS::ubuntu() => OS::ubuntu()
		case OS::windows() => OS::windows()
		
		case Region::california() => Region::california()
		case Region::capeTown() => Region::capeTown()
		case Region::frankfurt() => Region::frankfurt()
		case Region::bogota() => Region::bogota()
		case Region::seoul() => Region::seoul()
	};
	return p3;
}