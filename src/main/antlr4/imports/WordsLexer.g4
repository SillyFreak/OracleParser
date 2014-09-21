lexer grammar WordsLexer;

import Words;

WORD: ('a'..'z' '\''?)+ {
  setType(WordMapping.getTokenTypeForWord(getText()));
};