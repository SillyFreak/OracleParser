parser grammar NounPhraseParser;

import
	PostmodifierParser,
	PremodifierParser,
	PronounParser;

noun_sg:
  Player | Opponent |
  cardtype | Permanent | Token | Source | Card | Spell;
noun_pl:
  Players | Opponents |
  Artifacts | Creatures | Enchantments | Instants |
  Lands | Planeswalkers | Schemes | Sorceries |
  Permanents | Tokens | Sources | Cards | Spells;
noun_sg_possessive:
  Player_s | Opponent_s |
    Permanent_s | Token_s | Source_s | Card_s | Spell_s;
noun_pl_possessive:
  Players_ | Opponents_ |
    Permanents_ | Tokens_ | Sources_ | Cards_ | Spells_;

nounPhrase:	nounPhrase_sg | nounPhrase_pl;

nounPhrase_sg:	nounPhrase_sg1 | nounPhrase_sg2 | nounPhrase_sg3;
nounPhrase_sg1:
  determiner_sg? premodifier_sg?
  (pronoun_sg1_nominative | pronoun_sg1_oblique | pronoun_sg1_reflexive |
   pronoun_sg1_possessive | pronoun_sg_demonstrative | noun_sg | noun_sg_possessive
  )
  postmodifier?;

nounPhrase_sg2:
  determiner_sg? premodifier_sg?
  (pronoun_sp2_nominative | pronoun_sp2_oblique | pronoun_sg2_reflexive |
   pronoun_sp2_possessive | pronoun_sg_demonstrative | noun_sg | noun_sg_possessive
  )
  postmodifier?;

nounPhrase_sg3:
  determiner_sg? premodifier_sg?
  (pronoun_sg3_nominative | pronoun_sg3_oblique | pronoun_sg3_reflexive |
   pronoun_sg3_possessive | pronoun_sg_demonstrative | noun_sg | noun_sg_possessive
  )
  postmodifier?;


nounPhrase_pl:	nounPhrase_pl1 | nounPhrase_pl2 | nounPhrase_pl3;
nounPhrase_pl1:
  determiner_pl? premodifier_pl?
  (pronoun_pl1_nominative | pronoun_pl1_oblique | pronoun_pl1_reflexive |
   pronoun_pl1_possessive | pronoun_pl_demonstrative | noun_pl | noun_pl_possessive
  )
  postmodifier?;

nounPhrase_pl2:
  determiner_pl? premodifier_pl?
  (pronoun_sp2_nominative | pronoun_sp2_oblique | pronoun_pl2_reflexive |
   pronoun_sp2_possessive | pronoun_pl_demonstrative | noun_pl | noun_pl_possessive
  )
  postmodifier?;

nounPhrase_pl3:
  determiner_pl? premodifier_pl?
  (pronoun_pl3_nominative | pronoun_pl3_oblique | pronoun_pl3_reflexive |
   pronoun_pl3_possessive | pronoun_pl_demonstrative | noun_pl | noun_pl_possessive
  )
  postmodifier?;
  