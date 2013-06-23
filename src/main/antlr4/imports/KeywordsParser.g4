parser grammar KeywordsParser;

keywordCost:
  MANA;

keywordAbility:
  simpleKeyword | mediumKeyword | complexKeyword;

//simple keywords:  just one word
//medium keywords:  plus a number
//complex keywords: anything else

simpleKeyword:
  //simple evergreen keywords
  Deathtouch | Defender |
  Flash | Flying |
  Haste |
  Intimidate |
  Lifelink |
  Reach |
  Shroud |
  Trample |
  Vigilance |
  
  //simple block keywords
  Banding |
  Cascade | Changeling | Conspire | Convoke |
  Delve |
  Epic | Exalted |
  Fear | Flanking |
  Gravestorm |
  Haunt|Hideaway|Horsemanship|
  Infect|
  Persist | Phasing | Provoke |
  Rebound | Retrace |
  Shadow | Storm | Sunburst |
  Wither;
  
mediumKeyword:
  //medium evergreen keywords
  Double Strike #DoubleStrike |
  First Strike #FirstStrike |
  
  //medium block keywords
  Absorb number #Absorb |
  Amplify number #Amplify |
  Annihilator number #Annihilator |
  Battle Cry #BattleCry |
  Bloodthirst number #Bloodthirst |
  Bushido number #Bushido |
  Devour number #Devour |
  Dredge number #Dredge |
  Fading number #Fading |
  Frenzy number #Frenzy |
  Graft number #Graft |
  Living Weapon #LivingWeapon |
  Modular number #Modular |
  Poisonous number #Poisonous |
  Rampage number #Rampage |
  Ripple number #Ripple |
  Soulshift number #Soulshift |
  Split Second #SplitSecond |
  Totem Armor #TotemArmor |
  Vanishing number #Vanishing;
  
complexKeyword:
  //complex evergreen keywords
//  enchant |
  Equip keywordCost #Equip |
//  landwalk |
//  protection |
  
  //complex block keywords
//  affinity |
  Aura Swap keywordCost #AuraSwap |
//  bandsWith |
  Buyback keywordCost #Buyback |
//  champion: Champion someObjects -> ^(Champion someObjects);
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
//  offering |
  Prowl keywordCost #Prowl |
  Recover keywordCost #Recover |
//  Reinforce number DASH activationCost PERIOD? #Reinforce |
  Replicate keywordCost #Replicate |
//  splice |
//  Suspend number DASH activationCost PERIOD? #Suspend |
  Transfigure keywordCost #Transfigure |
  Transmute keywordCost #Transmute |
  Unearth keywordCost #Unearth// |
//  typecycling |
  ;
