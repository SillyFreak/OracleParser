lexer grammar SymbolLexer;

TAP: '{t}';
UNTAP: '{q}';

MANA:
  (OBRACE PART (SLASH PART)* CBRACE)+;

fragment PART:
  WHITE|BLUE|BLACK|RED|GREEN|SNOW|PHYREXIAN|VARIABLE|NUMBER;

//raw fragment
fragment OBRACE: '{';
fragment SLASH:  '/';
fragment CBRACE: '}';

fragment WHITE: 'w';
fragment BLUE:  'u';
fragment BLACK: 'b';
fragment RED:   'r';
fragment GREEN: 'g';

fragment SNOW:  's';
fragment PHYREXIAN:  'p';
