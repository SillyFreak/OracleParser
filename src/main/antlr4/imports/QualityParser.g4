parser grammar QualityParser;

singularObjectQuality:
  objectQuality |
  objectQuality Or objectQuality |
  objectQuality COMMA (objectQuality COMMA)+ Or objectQuality;

pluralObjectQuality:
  objectQuality |
  objectQuality And objectQuality |
  objectQuality COMMA (objectQuality COMMA)+ And objectQuality;

objectQuality:
  cardtypeQuality+? |
  supertypeQuality+ cardtypeQuality*? |
  colorQuality+ supertypeQuality* cardtypeQuality*?;

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
