parser grammar PremodifierParser;

import QualityParser;

premodifier: premodifier_sg | premodifier_pl;
premodifier_sg:
  premodifier0 |
  premodifier0 Or premodifier0 |
  premodifier0 COMMA (premodifier0 COMMA)+ Or premodifier0;

premodifier_pl:
  premodifier0 |
  premodifier0 And premodifier0 |
  premodifier0 COMMA (premodifier0 COMMA)+ And premodifier0;


fromPremodifier_pl:
  From premodifier0 |
  From premodifier0 And From premodifier0 |
  From premodifier0 COMMA (From premodifier0 COMMA)+ And From premodifier0;

forPremodifier_pl:
  For premodifier0 |
  For premodifier0 And For premodifier0 |
  For premodifier0 COMMA (For premodifier0 COMMA)+ And For premodifier0;


premodifier0:
  cardtypeQuality+? |
  supertypeQuality+ cardtypeQuality*? |
  colorQuality+ supertypeQuality* cardtypeQuality*?;
