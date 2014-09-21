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


singular3rdPlayerExpression:
  singular (Player | Opponent);

playerExpression:
  You |
  plural (Players | Opponents);

singularCardExpression:
  singular colorQuality* cardtypeQuality* Card;

pluralCardExpression:
  plural colorQuality* cardtypeQuality* Cards;

singularPermanent:
  colorQuality* cardtypeQuality* (Artifact | Creature | Enchantment | Land | Planeswalker | Permanent);

singularPermanentExpression:
  singular singularPermanent;

pluralPermanent:
  colorQuality* cardtypeQuality* (Artifacts | Creatures | Enchantments | Lands | /*Planeswalkers | */Permanents);

pluralPermanentExpression:
  plural pluralPermanent;
