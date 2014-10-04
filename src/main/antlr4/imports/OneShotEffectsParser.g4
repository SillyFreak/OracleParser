parser grammar OneShotEffectsParser;

oneShotEffect:
  and |
  choose |
  oneShotEffect0;

and:
  oneShotEffect0 And oneShotEffect0;

choose:
  (Choose |
   subject_sg3 Chooses |
   subject_other Choose
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
   subject_sg3 Counters |
   subject_other Counter
  )
  objectExpression;

destroyPermanents:
  (Destroy |
   subject_sg3 Destroys |
   subject_other Destroy
  )
  objectExpression;

discardCards:
  (Discard |
   subject_sg3 Discards |
   subject_other Discard
  )
  objectExpression;

drawCards:
  (Draw |
   subject_sg3 Draws |
   subject_other Draw
  )
  (A Card | numeral_pl Cards);

gainLife:
  (subject_sg3 Gains |
   subject_other Gain
  )
  number Life;

loseLife:
  (subject_sg3 Loses |
   subject_other Lose
  )
  number Life;

oneShotContinuous:
  continuousEffect |
  duration COMMA continuousEffect |
  continuousEffect duration;

payLife:
  (Pay |
   subject_sg3 Pays |
   subject_other Pay
  )
  number Life;

putCounter:
  (Put |
   subject_sg3 Puts |
   subject_other Put
  )
  counterExpression On objectExpression;

removeCounter:
  (Remove |
   /*subject_sg3 Removes |*/
   subject_other Remove
  )
  counterExpression From objectExpression;

returnToHand:
  (Return |
   subject_sg3 Returns |
   subject_other Return
  )
  (singularObjectExpression To Its Owner_s Hand |
   pluralObjectExpression To Their Owners_ Hands
  );

sacrificePermanents:
  (Sacrifice |
   subject_sg3 Sacrifices |
   subject_other Sacrifice
  )
  objectExpression;

tap:
  (Tap |
   subject_sg3 Taps |
   subject_other Tap
  )
  objectExpression;

untap:
  (Untap |
   subject_sg3 Untaps |
   subject_other Untap
  )
  objectExpression;
