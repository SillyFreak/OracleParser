parser grammar OracleParser;

options {
  tokenVocab = OracleLexer;
}

import
	AbilityParser,
	CounterParser,
	EffectsParser,
	ExpressionsParser,
	KeywordsParser,
	QualityParser;

line:
  (keywordAbility |
   activatedAbility |
   triggeredAbility |
   staticAbility |
   action
  ) EOF;
