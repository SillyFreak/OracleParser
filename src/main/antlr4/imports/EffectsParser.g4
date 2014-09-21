parser grammar AbilityParser;

effect:
  addMana |
  discardCards |
  drawCards |
  gainLife;

addMana:
  Add MANA To Your Mana Pool;

discardCards:
  (Discard |
   singular3rdPlayerExpression Discards |
   playerExpression Discard
  )
  (singularNumberExpression Card |
   pluralNumberExpression Cards
  );

drawCards:
  (Draw |
   singular3rdPlayerExpression Draws |
   playerExpression Draw
  )
  (singularNumberExpression Card |
   pluralNumberExpression Cards
  );

gainLife:
  You Gain number Life;
