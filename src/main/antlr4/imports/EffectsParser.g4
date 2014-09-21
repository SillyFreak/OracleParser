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
  (singularCardExpression |
   pluralCardExpression
  );

drawCards:
  (Draw |
   singular3rdPlayerExpression Draws |
   playerExpression Draw
  )
  (singularNumber Card |
   pluralNumber Cards
  );

gainLife:
  You Gain number Life;
