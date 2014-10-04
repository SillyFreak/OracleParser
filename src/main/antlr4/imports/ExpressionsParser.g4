parser grammar ExpressionsParser;

import
	NounPhraseParser,
	NumeralParser;


player3rdSubject:
  nounPhrase_sg3;

playerSubject:
  nounPhrase_sg1 | nounPhrase_sg2 | nounPhrase_pl;

objectExpression:
  singularObjectExpression | pluralObjectExpression;

singularObjectExpression:
  nounPhrase_sg (((COMMA nounPhrase_sg)+ COMMA)? Or nounPhrase_sg)? postmodifier?;

pluralObjectExpression:
  nounPhrase_pl (((COMMA nounPhrase_pl)+ COMMA)? And (SLASH Or)? nounPhrase_pl)? postmodifier?;


counterExpression:
  singularCounterExpression | pluralCounterExpression;

singularCounterExpression:
  determiner_sg counterType? Counter;

pluralCounterExpression:
  determiner_pl? counterType? Counters;
