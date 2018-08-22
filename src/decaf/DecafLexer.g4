lexer grammar DecafLexer;

@header {
package decaf;
}

options
{
  language=Java;
}

tokens
{
  TK_class
}

LCURLY : '{';
RCURLY : '}';

ID  : ('a'..'z' | 'A'..'Z')+;

WS : [ \t\r\n]+ -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

CHAR : '\'' ('ESPACE'..'~') '\'';
STRING : '"' (ESC|~'"')* '"';

fragment
ESC :  '\\' ('n'|'"');
