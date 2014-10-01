parser grammar OracleParser;

options {
  tokenVocab = OracleLexer;
}

import
	AbilityParser,
	ContinuousEffectsParser,
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

ptPump:
  (NUMBER | (PLUS|MINUS)? VARIABLE)
  SLASH
  (NUMBER | (PLUS|MINUS)? VARIABLE);
