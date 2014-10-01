parser grammar OracleParser;

options {
  tokenVocab = OracleLexer;
}

import
	AbilityParser,
	CounterParser,
	ExpressionsParser,
	KeywordsParser,
	OneShotEffectsParser,
	QualityParser,
	TriggerParser;

line:
  (keywordAbility (COMMA keywordAbility)* |
   activatedAbility |
   triggeredAbility |
   staticAbility |
   action
  ) EOF;
