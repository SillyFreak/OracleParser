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
  (singularNumber Card |
   pluralNumber Cards
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
