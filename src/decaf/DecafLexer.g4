lexer grammar DecafLexer;

@header {
package decaf;
}

options
{
  language=Java;
}

CLASS : 'class Program';

LCURLY : '{';
RCURLY : '}';

LSQBR : '[';
RSQBR : ']';

LPAR : '(';
RPAR : ')';

BOOLEAN : 'boolean';
BOOLEANLITERAL : 'true'|'false';
BREAK : 'break';
CALLOUT: 'callout';
CONTINUE : 'continue';
ELSE : 'else';
FOR: 'for';
IF : 'if';
INT: 'int';
RETURN : 'return';
VOID : 'void';

AND : '&&';
OR : '||';
EXCL : '!';
DEFINE: '=';
ADD : '+=';
SUBTRACT : '-=';
EQ : '==';
NEQ : '!=';
GT : '>';
GE : '>=';
LT : '<';
LE : '<=';
PLUS : '+';
MINUS : '-';
MUL : '*';
DIV : '/';
MOD : '%';
COMMA : ',';
COLON : ':';
SEMICOLON : ';';

WS : [ \t\r\n]+ -> skip;

SL_COMMENT : '//'(~'\n')*'\n' -> skip;

ID: (LETTER|'_')(LETTER|DIGIT|'_')*;

CHAR: '\''(ESC|LETTER|DIGIT|' '|'!'|'#'|'$'|'%'|'&'|'('|')'|'*'|'+'|','|'-'|'.'|'/'|':'|';'|'<'|'='|'>'|'?'|'@'|'['|']'|'^'|'_'|'´'|'`'|'{'|'|'|'}'|'~')'\'';
STRING: '"'(LETTER|DIGIT|' '|'!'|'"'|'#'|'$'|'%'|'&'|'\\\''|'('|')'|'*'|'+'|','|'-'|'.'|'/'|':'|';'|'<'|'='|'>'|'?'|'@'|'['|']'|'^'|'_'|'´'|'`'|'{'|'|'|'}'|'~'|'\t'|'\\'|'\"')*'"';
INTLITERAL : DIGIT(DIGIT)*;
HEXLITERAL : '0x'(DIGIT|HEXDIGIT)+;

fragment LETTER : ('a'..'z'|'A'..'Z');
fragment DIGIT : ('0'..'9');
fragment HEXDIGIT : ('a'..'f'|'A'..'F');
fragment ESC : '\\'('n'|'t'|'\\'|'"');
