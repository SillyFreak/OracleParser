parser grammar KeywordsParser;

keywordCost:
  MANA;

keywordAbility:
  simpleKeywordAbility | mediumKeywordAbility | complexKeywordAbility;

//simple keywords:  just one word
//medium keywords:  plus a number
//complex keywords: anything else

simpleKeywordAbility:
  //simple evergreen keywords
  Deathtouch | Defender | doubleStrike |
  firstStrike | Flash | Flying |
  Haste |
  Intimidate |
  Lifelink |
  Reach |
  Shroud |
  Trample |
  Vigilance |
  
  //simple block keywords
  Banding | battleCry |
  Cascade | Changeling | Conspire | Convoke |
  Delve |
  Epic | Exalted |
  Fear | Flanking |
  Gravestorm |
  Haunt|Hideaway|Horsemanship|
  Infect|
  livingWeapon |
  Persist | Phasing | Provoke |
  Rebound | Retrace |
  Shadow | splitSecond | Storm | Sunburst |
  totemArmor |
  Wither;
  
mediumKeywordAbility:
  mediumKeyword number;

mediumKeyword:
  //medium evergreen keywords
  
  //medium block keywords
  Absorb | Amplify | Annihilator |
  Bloodthirst | Bushido |
  Devour | Dredge |
  Fading | Frenzy |
  Graft |
  Modular |
  Poisonous |
  Rampage | Ripple |
  Soulshift |
  Vanishing;
  
complexKeywordAbility:
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

doubleStrike:	Double Strike;
firstStrike:	First Strike;

battleCry:		Battle Cry;
livingWeapon:	Living Weapon;
splitSecond:	Split Second;
totemArmor:		Totem Armor;
