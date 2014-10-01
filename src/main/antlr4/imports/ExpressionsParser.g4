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
  Target | Each;

plural:
  (Up To)? pluralNumber |
  (Up To)? pluralNumber Target |
  All;


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


singularObjectNoun:
  cardtype | Permanent | Card | Spell;

//TODO check if the parse tree is as desired
singularObject:
  singularObjectQuality singularObjectNoun;

singularObjectList:
  singularObject (((COMMA singularObject)+ COMMA)? Or singularObject)?;

singularObjectExpression:
  SELF | (Enchanted | Equipped | singular) singularObjectList;

pluralObjectNoun:
  Artifacts | Creatures | Enchantments | Instants |
  Lands | /*Planeswalkers | */ Schemes | /*Sorceries | */
  Permanents | Cards | Spells;

pluralObject:
  pluralObjectQuality pluralObjectNoun;

pluralObjectList:
  pluralObject (((COMMA pluralObject)+ COMMA)? And (SLASH Or)? pluralObject)?;

pluralObjectExpression:
  plural pluralObjectList;


counterExpression:
  singularCounterExpression | pluralCounterExpression;

singularCounterExpression:
  singular counterType Counter;

pluralCounterExpression:
  plural counterType Counters;
