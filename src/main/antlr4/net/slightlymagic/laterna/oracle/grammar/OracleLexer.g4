lexer grammar OracleLexer;

import SymbolLexer, WordsLexer;

COLON: ':';
SEMI:  ';';
COMMA: ',';
PERIOD: '.';
SELF: '~';
SLASH: '/';
SELFS: '~\'s';
DASH: '--'|'\u2012'..'\u2015';

NUMBER: ('+'|'-')? ('0' | ('1'..'9') ('0'..'9')*);
VARIABLE: 'x' | 'y' | 'z';
PLUS: '+';
MINUS: '-';

fragment DQ:  '"' (~'"')*  '"';
QUOTED: DQ;

WS: [ \t\f\r\n]+ -> skip;
