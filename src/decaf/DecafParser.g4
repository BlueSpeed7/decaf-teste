parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

program : CLASS LCURLY (field_decl)* (method_decl)* RCURLY EOF;
field_decl : (type id)(COMMA type id)* SEMICOLON;
method_decl : (type | VOID) ID LPAR (type ID(COMMA type ID)*)? RPAR block;
block : LCURLY (var_decl)* (statement)* RCURLY;
var_decl : type ID(COMMA ID)* SEMICOLON;
type : INT | BOOLEAN;
statement : location assign_op expr SEMICOLON | method_call SEMICOLON | IF LPAR expr RPAR block (ELSE block)? | FOR ID DEFINE expr COMMA expr block | RETURN (expr)? SEMICOLON | BREAK SEMICOLON | CONTINUE SEMICOLON | block;
assign_op : DEFINE | ADD | SUBTRACT;
method_call : ID LPAR (expr(COMMA expr)*)? RPAR | CALLOUT LPAR STRING (COMMA callout_arg(COMMA callout_arg)*)? RPAR;
location : ID | ID LSQBR expr RSQBR;
expr : location | method_call | literal | expr bin_op expr | MINUS expr | EXCL expr | LPAR expr RPAR;
callout_arg : expr | STRING;
bin_op : arith_op | rel_op | eq_op | cond_op;
arith_op : PLUS | MINUS | MUL | DIV | MOD;
rel_op : LT | GT | LE | GE;
eq_op : EQ | NEQ;
cond_op : AND | OR;
literal : int_literal | CHAR | BOOLEANLITERAL;
int_literal : INTLITERAL | HEXLITERAL;
id : ID | ID LSQBR? int_literal RSQBR?;
