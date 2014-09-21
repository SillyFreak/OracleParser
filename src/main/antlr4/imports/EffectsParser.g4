parser grammar AbilityParser;

effect:
  addMana |
  destroyPermanents |
  discardCards |
  drawCards |
  gainLife |
  loseLife |
  sacrificePermanents;

addMana:
  Add MANA To Your Mana Pool;

destroyPermanents:
  (Destroy |
   singular3rdPlayerExpression Destroys |
   playerExpression Destroy
  )
  (singularObjectExpression |
   pluralObjectExpression
  );

discardCards:
  (Discard |
   singular3rdPlayerExpression Discards |
   playerExpression Discard
  )
  (singularObjectExpression |
   pluralObjectExpression
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
  (singular3rdPlayerExpression Gains |
   playerExpression Gain
  )
  number Life;

loseLife:
  (singular3rdPlayerExpression Loses |
   playerExpression Lose
  )
  number Life;

sacrificePermanents:
  (Sacrifice |
   singular3rdPlayerExpression Sacrifices |
   playerExpression Sacrifice
  )
  (singularObjectExpression |
   pluralObjectExpression
  );
