parser grammar KeywordsParser;

keywordCost:
  MANA;

keywordAbility:
  keyword;

//simple keywords:  just one word
//medium keywords:  plus a number
//complex keywords: anything else
keyword:

//simple evergreen keywords
  Deathtouch #Deathtouch |
  Defender #Defender |
  Double Strike #DoubleStrike |
 
  First Strike #FirstStrike |
  Flash #Flash |
  Flying #Flying |
 
  Haste #Haste |
 
  Intimidate #Intimidate |
 
  Lifelink #Lifelink |
 
  Reach #Reach |
 
  Shroud #Shroud |
 
  Trample #Trample |
 
  Vigilance #Vigilance |
 
  
//simple block keywords
  Banding #Banding |
  Battle Cry #BattleCry |
 
  Cascade #Cascade |
  Changeling #Changeling |
  Conspire #Conspire |
  Convoke #Convoke |
 
  Delve #Delve |
 
  Epic #Epic |
  Exalted #Exalted |
 
  Fear #Fear |
  Flanking #Flanking |
 
  Gravestorm #Gravestorm |
 
  Haunt #Haunt |
  Hideaway #Hideaway |
  Horsemanship #Horsemanship |
 
  Infect #Infect |
 
  Living Weapon #LivingWeapon |
 
  Persist #Persist |
  Phasing #Phasing |
  Provoke #Provoke |
 
  Rebound #Rebound |
  Retrace #Retrace |
 
  Shadow #Shadow |
  Split Second #SplitSecond |
  Storm #Storm |
  Sunburst #Sunburst |
 
  Totem Armor #TotemArmor |
 
  Wither #Wither |
  
  
//medium evergreen keywords
  
//medium block keywords
  Absorb number #Absorb |
  Amplify number #Amplify |
  Annihilator number #Annihilator |
 
  Bloodthirst number #Bloodthirst |
  Bushido number #Bushido |
 
  Devour number #Devour |
  Dredge number #Dredge |
 
  Fading number #Fading |
  Frenzy number #Frenzy |
 
  Graft number #Graft |
 
  Modular number #Modular |
 
  Poisonous number #Poisonous |
 
  Rampage number #Rampage |
  Ripple number #Ripple |
 
  Soulshift number #Soulshift |
 
  Vanishing number #Vanishing |
  
  
//complex evergreen keywords
  Enchant (singularPermanent | Player | Opponent) #Enchant |
  Equip keywordCost #Equip |
//  landwalk #Landwalk |
//  Protection From #Protection |
  
  
//complex block keywords
  Affinity For pluralPermanent #Affinity |
  Aura Swap keywordCost #AuraSwap |
//  Bands With #BandsWith |
  Buyback keywordCost #Buyback |
  Champion (singularPermanentExpression | pluralPermanentExpression) #Champion |
  Cumulative Upkeep keywordCost #CumulativeUpkeep |
  Cycling keywordCost #Cycling |
  Echo keywordCost #Echo |
  Entwine keywordCost #Entwine |
  Evoke keywordCost #Evoke |
  Flashback keywordCost #Flashback |
//  forecast: Forecast DASH activatedAbility -> ^(Forecast activatedAbility);
  Fortify keywordCost #Fortify |
  Kicker keywordCost #Kicker |
  Level Up keywordCost #LevelUp |
  Madness keywordCost #Madness |
  Morph keywordCost #Morph |
  Multikicker keywordCost #Multikicker |
  Ninjutsu keywordCost #Ninjutsu |
//  Offering #Offering |
  Prowl keywordCost #Prowl |
  Recover keywordCost #Recover |
//  Reinforce number DASH activationCost PERIOD? #Reinforce |
  Replicate keywordCost #Replicate |
//  Splice Onto #Splice |
//  Suspend number DASH activationCost PERIOD? #Suspend |
  Transfigure keywordCost #Transfigure |
  Transmute keywordCost #Transmute |
  Unearth keywordCost #Unearth// |
//  typecycling #Typecycling |
  ;
