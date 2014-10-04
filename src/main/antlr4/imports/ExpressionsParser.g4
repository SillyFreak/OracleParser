parser grammar ExpressionsParser;

import
	NounPhraseParser,
	NumeralParser;


player3rdSubject:
  nounPhrase_sg3;

playerSubject:
  nounPhrase_sg1 | nounPhrase_sg2 | nounPhrase_pl;


playerExpression:
  singularPlayerExpression | pluralPlayerExpression;

singularPlayerExpression:
  nounPhrase_sg;

pluralPlayerExpression:
  nounPhrase_pl;


objectExpression:
  singularObjectExpression | pluralObjectExpression;


//TODO check if the parse tree is as desired
singularObject:
  nounPhrase_sg;

singularObjectExpression:
  singularObject (((COMMA singularObject)+ COMMA)? Or singularObject)? postmodifier?;


pluralObject:
  nounPhrase_pl;

pluralObjectExpression:
  pluralObject (((COMMA pluralObject)+ COMMA)? And (SLASH Or)? pluralObject)? postmodifier?;


counterExpression:
  singularCounterExpression | pluralCounterExpression;

singularCounterExpression:
  determiner_sg counterType? Counter;

pluralCounterExpression:
  determiner_pl? counterType? Counters;
