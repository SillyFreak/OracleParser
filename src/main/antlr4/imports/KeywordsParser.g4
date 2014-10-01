parser grammar KeywordsParser;

fromPluralObjectQuality:
  From objectQuality |
  From objectQuality And From objectQuality |
  From objectQuality COMMA (From objectQuality COMMA)+ And From objectQuality;

fromPluralObject:
  From pluralObjectQuality? pluralObjectNoun;

fromPluralObjectList:
  fromPluralObject (((COMMA fromPluralObject)+ COMMA)? And (SLASH Or)? fromPluralObject)?;


forPluralObjectQuality:
  For objectQuality |
  For objectQuality And For objectQuality |
  For objectQuality COMMA (For objectQuality COMMA)+ And For objectQuality;

forPluralObject:
  For pluralObjectQuality? pluralObjectNoun;

forPluralObjectList:
  forPluralObject (((COMMA forPluralObject)+ COMMA)? And (SLASH Or)? forPluralObject)?;


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
  Enchant (singularObjectList | Player | Opponent) #Enchant |
  Equip keywordCost #Equip |
  objectQuality? (Plainswalk | Islandwalk | Swampwalk | Mountainwalk | Forestwalk | Landwalk | Desertwalk) #Landwalk |
  Protection (fromPluralObjectList | fromPluralObjectQuality) #Protection |
  
  
//complex block keywords
  Affinity forPluralObjectList #Affinity |
  Aura Swap keywordCost #AuraSwap |
  Bands With Other pluralObjectList #BandsWith |
  Buyback keywordCost #Buyback |
  Champion objectExpression #Champion |
  Cumulative Upkeep keywordCost #CumulativeUpkeep |
  Cycling keywordCost #Cycling |
  Echo keywordCost #Echo |
  Entwine keywordCost #Entwine |
  Evoke keywordCost #Evoke |
  Flashback keywordCost #Flashback |
  Forecast DASH activatedAbility #Forecast |
  Fortify keywordCost #Fortify |
  Kicker keywordCost #Kicker |
  Level Up keywordCost #LevelUp |
  Madness keywordCost #Madness |
  Morph keywordCost #Morph |
  Multikicker keywordCost #Multikicker |
  Ninjutsu keywordCost #Ninjutsu |
  singularObject Offering #Offering |
  Prowl keywordCost #Prowl |
  Recover keywordCost #Recover |
  Reinforce number DASH activationCost PERIOD? #Reinforce |
  Replicate keywordCost #Replicate |
//  Splice Onto #Splice |
  Suspend number DASH activationCost PERIOD? #Suspend |
  Transfigure keywordCost #Transfigure |
  Transmute keywordCost #Transmute |
  Unearth keywordCost #Unearth// |
//  typecycling #Typecycling |
  ;
