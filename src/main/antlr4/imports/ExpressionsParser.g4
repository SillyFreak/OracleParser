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


singularObjectNoun:
  cardtype | Permanent | Token | Source | Card | Spell;

//TODO check if the parse tree is as desired
singularObject:
  nounPhrase_sg;

singularObjectList:
  singularObject (((COMMA singularObject)+ COMMA)? Or singularObject)? postmodifier?;

singularObjectExpression:
  nounPhrase_sg;

pluralObjectNoun:
  Artifacts | Creatures | Enchantments | Instants |
  Lands | Planeswalkers | Schemes | Sorceries |
  Permanents | Tokens | Sources | Cards | Spells;

pluralObject:
  nounPhrase_pl;

pluralObjectList:
  pluralObject (((COMMA pluralObject)+ COMMA)? And (SLASH Or)? pluralObject)? postmodifier?;

pluralObjectExpression:
  nounPhrase_pl;


counterExpression:
  singularCounterExpression | pluralCounterExpression;

singularCounterExpression:
  determiner_sg counterType? Counter;

pluralCounterExpression:
  determiner_pl? counterType? Counters;
