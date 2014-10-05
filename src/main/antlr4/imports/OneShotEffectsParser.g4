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
  dealDamage |
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
  nounPhrase;

dealDamage:
  (Deal |
   subject_sg3 Deals |
   subject_other Deal
  )
  numeral Damage To nounPhrase;

destroyPermanents:
  (Destroy |
   subject_sg3 Destroys |
   subject_other Destroy
  )
  nounPhrase;

discardCards:
  (Discard |
   subject_sg3 Discards |
   subject_other Discard
  )
  nounPhrase;

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
  nounPhrase On nounPhrase;

removeCounter:
  (Remove |
   /*subject_sg3 Removes |*/
   subject_other Remove
  )
  nounPhrase From nounPhrase;

returnToHand:
  (Return |
   subject_sg3 Returns |
   subject_other Return
  )
  (nounPhrase_sg To Its Owner_s Hand |
   nounPhrase_pl To Their Owners_ Hands
  );

sacrificePermanents:
  (Sacrifice |
   subject_sg3 Sacrifices |
   subject_other Sacrifice
  )
  nounPhrase;

tap:
  (Tap |
   subject_sg3 Taps |
   subject_other Tap
  )
  nounPhrase;

untap:
  (Untap |
   subject_sg3 Untaps |
   subject_other Untap
  )
  nounPhrase;
