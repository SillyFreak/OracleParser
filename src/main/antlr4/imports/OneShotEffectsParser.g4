parser grammar OneShotEffectsParser;

oneShotEffect:
  and |
  choose |
  oneShotEffect0;

and:
  oneShotEffect0 And oneShotEffect0;

choose:
  (Choose |
   player3rdSubject Chooses |
   playerSubject Choose
  ) numberWord DASH
  oneShotEffect0 (SEMI Or oneShotEffect0)*;


oneShotEffect0:
  addMana |
  counter |
  destroyPermanents |
  discardCards |
  drawCards |
  gainLife |
  loseLife |
  oneShotContinuous |
  payLife |
  putCounter |
  removeCounter |
  returnToHand |
  sacrificePermanents |
  tap |
  untap;


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

oneShotContinuous:
  continuousEffect |
  duration COMMA continuousEffect |
  continuousEffect duration;

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

returnToHand:
  (Return |
   player3rdSubject Returns |
   playerSubject Return
  )
  (singularObjectExpression To Its Owner_s Hand |
   pluralObjectExpression To Their Owners_ Hands
  );

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
