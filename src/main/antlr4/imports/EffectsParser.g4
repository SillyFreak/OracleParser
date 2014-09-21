parser grammar AbilityParser;

effect:
  addMana |
  counter |
  destroyPermanents |
  discardCards |
  drawCards |
  gainLife |
  loseLife |
  putCounter |
  removeCounter |
  sacrificePermanents;

addMana:
  Add MANA To Your Mana Pool;

counter:
  (Counter |
   singular3rdPlayerExpression Counters |
   playerExpression Counter
  )
  (singularObjectExpression |
   pluralObjectExpression
  );

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

putCounter:
  (Put |
   singular3rdPlayerExpression Puts |
   playerExpression Put
  )
  (singular counterType Counter |
   plural counterType Counters
  )
  On
  (singularObjectExpression |
   pluralObjectExpression
  );

removeCounter:
  (Remove |
   /*singular3rdPlayerExpression Removes |*/
   playerExpression Remove
  )
  (singular counterType Counter |
   plural counterType Counters
  )
  From
  (singularObjectExpression |
   pluralObjectExpression
  );

sacrificePermanents:
  (Sacrifice |
   singular3rdPlayerExpression Sacrifices |
   playerExpression Sacrifice
  )
  (singularObjectExpression |
   pluralObjectExpression
  );
