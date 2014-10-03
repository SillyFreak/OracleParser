parser grammar ExpressionsParser;

import NumeralParser;

singular:
  (Up To)? singularNumber |
  (Up To)? singularNumber Target |
  Another |
  Another? Target |
  Each Other?|
  This | That;

plural:
  (Up To)? pluralNumber Other? |
  (Up To)? pluralNumber Other? Target |
  All Other? | Other | Those |;


player3rdSubject:
  singular (Player | Opponent) | He Or She;

playerSubject:
  You |
  plural (Players | Opponents);


playerExpression:
  singularPlayerExpression | pluralPlayerExpression;

singularPlayerExpression:
  singular (Player | Opponent);

pluralPlayerExpression:
  plural (Players | Opponents);


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
  SELF | (Enchanted | Equipped | singular) singularObjectList;

pluralObjectNoun:
  Artifacts | Creatures | Enchantments | Instants |
  Lands | /*Planeswalkers | */ Schemes | /*Sorceries | */
  Permanents | Tokens | Sources | Cards | Spells;

pluralObject:
  Other? pluralObjectQuality? pluralObjectNoun;

pluralObjectList:
  pluralObject (((COMMA pluralObject)+ COMMA)? And (SLASH Or)? pluralObject)? controllerSpecifier?;

pluralObjectExpression:
  plural pluralObjectList;


counterExpression:
  singularCounterExpression | pluralCounterExpression;

singularCounterExpression:
  singular counterType? Counter;

pluralCounterExpression:
  plural counterType? Counters;
