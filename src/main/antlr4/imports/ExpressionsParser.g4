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

singular3rdPlayerExpression:
  Target (Player | Opponent);

playerExpression:
  You |
  All (Players | Opponents);

singularCardExpression:
  singularNumber colorQuality? Card;

pluralCardExpression:
  pluralNumber colorQuality? Cards;
