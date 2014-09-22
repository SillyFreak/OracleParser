parser grammar ExpressionsParser;

singularNumber:
  A | An | One |
  (NUMBER {"1".equals(getRuleContext().getText())}?);

pluralNumber:
  VARIABLE |
  (NUMBER {!"1".equals(getRuleContext().getText())}?) |
  Two | Three | Four | Five | Six |
  Seven | Eight | Nine | Ten | Twelve |
  Thirteen | Fifteen | Twenty;

number:
  NUMBER | VARIABLE;

singular:
  singularNumber |
  singularNumber Target |
  Target | Each;

plural:
  pluralNumber |
  pluralNumber Target |
  All | Each;


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


objectQuality:
  colorQuality* supertypeQuality* cardtypeQuality*;
objectNoun:
  cardtypeQuality | Permanent | Card | Spell;

//TODO check if the parse tree is as desired
singularObject:
  colorQuality* supertypeQuality* cardtypeQuality* objectNoun |
  objectQuality (((COMMA objectQuality)+ COMMA)? Or objectQuality)? objectNoun;

singularObjectExpression:
  singular singularObject;

pluralObject:
  colorQuality* supertypeQuality* cardtypeQuality*
  (Artifacts | Creatures | Enchantments | Instants |
   Lands | /*Planeswalkers | */ Schemes | /*Sorceries | */
   Permanents | Cards | Spells);

pluralObjectExpression:
  plural pluralObject;


counterExpression:
  singularCounterExpression | pluralCounterExpression;

singularCounterExpression:
  singular counterType Counter;

pluralCounterExpression:
  plural counterType Counters;
