parser grammar QualityParser;

colorQuality:
  color | noncolor |
  Colorless | Monocolored | Multicolored;

color:
  White | Blue | Black | Red | Green;

noncolor:
  Nonwhite | Nonblue | Nonblack | Nonred | Nongreen;

supertypeQuality:
  supertype | nonsupertype;

supertype:
  Basic | Legendary | /*Ongoing |*/ Snow /*| World*/;

nonsupertype:
  Nonbasic | Nonlegendary | /*Nonongoing |*/ Nonsnow /*| Nonworld*/;

cardtypeQuality:
  cardtype | noncardtype;

cardtype:
  Artifact | Creature | Enchantment | Instant |
  Land | Planeswalker | Scheme | Sorcery;
//  Phenomenon Plane Tribal Vanguard

noncardtype:
  Nonartifact | Noncreature | Nonenchantment | Nonland;
//  Noninstant Nonphenomenon Nonplane Nonplaneswalker
//  Nonscheme Nonsorcery Nontribal Nonvanguard
  