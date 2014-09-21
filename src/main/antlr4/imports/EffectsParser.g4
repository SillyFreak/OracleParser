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
   player3rdSubject Counters |
   playerSubject Counter
  )
  objectExpression;

destroyPermanents:
  (Destroy |
   player3rdSubject Destroys |
   playerSubject Destroy
  )
  objectExpression;

discardCards:
  (Discard |
   player3rdSubject Discards |
   playerSubject Discard
  )
  objectExpression;

drawCards:
  (Draw |
   player3rdSubject Draws |
   playerSubject Draw
  )
  (singularNumber Card | pluralNumber Cards);

gainLife:
  (player3rdSubject Gains |
   playerSubject Gain
  )
  number Life;

loseLife:
  (player3rdSubject Loses |
   playerSubject Lose
  )
  number Life;

putCounter:
  (Put |
   player3rdSubject Puts |
   playerSubject Put
  )
  counterExpression On objectExpression;

removeCounter:
  (Remove |
   /*player3rdSubject Removes |*/
   playerSubject Remove
  )
  counterExpression From objectExpression;

sacrificePermanents:
  (Sacrifice |
   player3rdSubject Sacrifices |
   playerSubject Sacrifice
  )
  objectExpression;
