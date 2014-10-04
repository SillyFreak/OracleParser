parser grammar QualityParser;

colorQuality:
  color | noncolor |
  Colored | Colorless | Monocolored | Multicolored;

color:
  White | Blue | Black | Red | Green;

noncolor:
  Nonwhite | Nonblue | Nonblack | Nonred | Nongreen;

supertypeQuality:
  supertype | nonsupertype;

supertype:
  Basic | Legendary | Ongoing | Snow | World;

nonsupertype:
  Nonbasic | Nonlegendary | Nonongoing | Nonsnow | Nonworld;

cardtypeQuality:
  cardtype | noncardtype;

cardtype:
  Artifact | Creature | Enchantment | Instant |
  Land | Phenomenon | Plane | Planeswalker |
  Scheme | Sorcery | Tribal | Vanguard;

noncardtype:
  Nonartifact | Noncreature | Nonenchantment | Noninstant |
  Nonland | Nonphenomenon | Nonplane | Nonplaneswalker |
  Nonscheme | Nonsorcery | Nontribal | Nonvanguard;
