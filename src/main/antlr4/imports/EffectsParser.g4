parser grammar AbilityParser;

effect:
  addMana |
  destroyPermanents |
  discardCards |
  drawCards |
  gainLife |
  sacrificePermanents;

addMana:
  Add MANA To Your Mana Pool;

destroyPermanents:
  (Destroy |
   singular3rdPlayerExpression Destroys |
   playerExpression Destroy
  )
  (singularPermanentExpression |
   pluralPermanentExpression
  );

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

sacrificePermanents:
  (Sacrifice |
   singular3rdPlayerExpression Sacrifices |
   playerExpression Sacrifice
  )
  (singularPermanentExpression |
   pluralPermanentExpression
  );
