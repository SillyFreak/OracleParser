parser grammar OracleParser;

options {
  tokenVocab = OracleLexer;
}

import KeywordsParser;

line:
  keywordAbility EOF;

number:
  NUMBER |
  VARIABLE;
