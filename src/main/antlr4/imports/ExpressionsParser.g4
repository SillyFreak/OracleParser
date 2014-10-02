parser grammar ExpressionsParser;

singularNumber:
  A | An | One |
  (NUMBER {"1".equals(getRuleContext().getText())}?);

pluralNumber:
  VARIABLE |
  (NUMBER {!"1".equals(getRuleContext().getText())}?) |
  pluralNumberWord;

pluralNumberWord:
  Two | Three | Four | Five | Six |
  Seven | Eight | Nine | Ten | Twelve |
  Thirteen | Fifteen | Twenty;

number:
  NUMBER | VARIABLE;

singular:
  (Up To)? singularNumber |
  (Up To)? singularNumber Target |
  Another |
  Another? Target |
  Each Other?;

plural:
  (Up To)? pluralNumber Other? |
  (Up To)? pluralNumber Other? Target |
  All | Other |;


player3rdSubject:
  singular (Player | Opponent);

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
