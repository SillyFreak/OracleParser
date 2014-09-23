parser grammar AbilityParser;

effect:
  addMana |
  choose |
  counter |
  destroyPermanents |
  discardCards |
  drawCards |
  gainLife |
  loseLife |
  payLife |
  putCounter |
  removeCounter |
  sacrificePermanents |
  tap |
  untap;

addMana:
  Add MANA To Your Mana Pool;

choose:
  (Choose |
   player3rdSubject Chooses |
   playerSubject Choose
  ) (One | pluralNumberWord) DASH
  effect (SEMI Or effect)*;

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

payLife:
  (Pay |
   player3rdSubject Pays |
   playerSubject Pay
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

tap:
  (Tap |
   player3rdSubject Taps |
   playerSubject Tap
  )
  objectExpression;

untap:
  (Untap |
   player3rdSubject Untaps |
   playerSubject Untap
  )
  objectExpression;
