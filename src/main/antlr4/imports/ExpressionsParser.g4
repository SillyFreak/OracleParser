parser grammar ExpressionsParser;

import
	NounPhraseParser,
	NumeralParser;


player3rdSubject:
  determiner_sg (Player | Opponent) | He Or She;

playerSubject:
  determiner_pl? (Players | Opponents) | You;


playerExpression:
  singularPlayerExpression | pluralPlayerExpression;

singularPlayerExpression:
  determiner_sg (Player | Opponent);

pluralPlayerExpression:
  determiner_pl? (Players | Opponents);


objectExpression:
  singularObjectExpression | pluralObjectExpression;


controllerSpecifier:
  (playerSubject Control | player3rdSubject Controls);

singularObjectNoun:
  cardtype | Permanent | Token | Source | Card | Spell;

//TODO check if the parse tree is as desired
singularObject:
  singularObjectQuality? singularObjectNoun;

singularObjectList:
  singularObject (((COMMA singularObject)+ COMMA)? Or singularObject)? controllerSpecifier?;

singularObjectExpression:
  SELF | (Enchanted | Equipped | determiner_sg) singularObjectList;

pluralObjectNoun:
  Artifacts | Creatures | Enchantments | Instants |
  Lands | /*Planeswalkers | */ Schemes | /*Sorceries | */
  Permanents | Tokens | Sources | Cards | Spells;

pluralObject:
  Other? pluralObjectQuality? pluralObjectNoun;

pluralObjectList:
  pluralObject (((COMMA pluralObject)+ COMMA)? And (SLASH Or)? pluralObject)? controllerSpecifier?;

pluralObjectExpression:
  determiner_pl? pluralObjectList;


counterExpression:
  singularCounterExpression | pluralCounterExpression;

singularCounterExpression:
  determiner_sg counterType? Counter;

pluralCounterExpression:
  determiner_pl? counterType? Counters;
