parser grammar OracleParser;

options {
  tokenVocab = OracleLexer;
}

import KeywordsParser, AbilityParser, EffectsParser, QualityParser;

line:
  (keywordAbility |
   activatedAbility |
   triggeredAbility |
   staticAbility |
   action
  ) EOF;

number:
  NUMBER |
  VARIABLE;

numberWord:
  A | An | VARIABLE |
  One | Two | Three | Four | Five |
  Six | Seven | Eight | Nine | Ten;
