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
  objectExpression;

destroyPermanents:
  (Destroy |
   singular3rdPlayerExpression Destroys |
   playerExpression Destroy
  )
  objectExpression;

discardCards:
  (Discard |
   singular3rdPlayerExpression Discards |
   playerExpression Discard
  )
  objectExpression;

drawCards:
  (Draw |
   singular3rdPlayerExpression Draws |
   playerExpression Draw
  )
  (singularNumber Card | pluralNumber Cards);

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
  On objectExpression;

removeCounter:
  (Remove |
   /*singular3rdPlayerExpression Removes |*/
   playerExpression Remove
  )
  (singular counterType Counter |
   plural counterType Counters
  )
  From objectExpression;

sacrificePermanents:
  (Sacrifice |
   singular3rdPlayerExpression Sacrifices |
   playerExpression Sacrifice
  )
  objectExpression;
