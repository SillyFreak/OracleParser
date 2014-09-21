parser grammar AbilityParser;

effect:
  addMana |
  discardCards |
  drawCards |
  gainLife;

addMana:
  Add MANA To Your Mana Pool;

discardCards:
  Discard (singularNumberExpression Card | pluralNumberExpression Cards);

drawCards:
  Draw (singularNumberExpression Card | pluralNumberExpression Cards);

gainLife:
  You Gain number Life;
