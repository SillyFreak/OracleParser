parser grammar ExpressionsParser;

import
	NounPhraseParser,
	NumeralParser;


subject_sg3:
  nounPhrase_sg3;

subject_other:
  nounPhrase_sg1 | nounPhrase_sg2 | nounPhrase_pl;

objectExpression:
  singularObjectExpression | pluralObjectExpression;

singularObjectExpression:
  nounPhrase_sg (((COMMA nounPhrase_sg)+ COMMA)? Or nounPhrase_sg)? postmodifier?;

pluralObjectExpression:
  nounPhrase_pl (((COMMA nounPhrase_pl)+ COMMA)? And (SLASH Or)? nounPhrase_pl)? postmodifier?;

counterExpression:
  nounPhrase;
