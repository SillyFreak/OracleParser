parser grammar NounPhraseParser;

import
	PostmodifierParser,
	PremodifierParser,
	PronounParser;

noun_sg:
  Player | Opponent |
  cardtype | Permanent | Token | Source | Card | Spell |
  counterType? Counter;
noun_pl:
  Players | Opponents |
  Artifacts | Creatures | Enchantments | Instants |
  Lands | Planeswalkers | Schemes | Sorceries |
  Permanents | Tokens | Sources | Cards | Spells |
  counterType? Counters;
noun_sg_possessive:
  Player_s | Opponent_s |
    Permanent_s | Token_s | Source_s | Card_s | Spell_s;
noun_pl_possessive:
  Players_ | Opponents_ |
    Permanents_ | Tokens_ | Sources_ | Cards_ | Spells_;

nounPhrase:	nounPhrase_sg | nounPhrase_pl;

nounPhrase_sg:
  (nounPhrase_compound |
   determiner_sg? premodifier_sg?
   (pronoun_sg | noun_sg | noun_sg_possessive)
  )
  postmodifier?;

nounPhrase_sg1:
  (nounPhrase_compound |
   determiner_sg? premodifier_sg?
   (pronoun_sg1 | noun_sg | noun_sg_possessive)
  )
  postmodifier?;

nounPhrase_sg2:
  (nounPhrase_compound |
   determiner_sg? premodifier_sg?
   (pronoun_sg2 | noun_sg | noun_sg_possessive)
  )
  postmodifier?;

nounPhrase_sg3:
  (nounPhrase_compound |
   determiner_sg? premodifier_sg?
   (pronoun_sg3 | noun_sg | noun_sg_possessive)
  )
  postmodifier?;


nounPhrase_pl:
  (nounPhrase_compound |
   determiner_pl? premodifier_pl?
   (pronoun_pl | noun_pl | noun_pl_possessive)
  )
  postmodifier?;

nounPhrase_pl1:
  (nounPhrase_compound |
   determiner_pl? premodifier_pl?
   (pronoun_pl1 | noun_pl | noun_pl_possessive)
  )
  postmodifier?;

nounPhrase_pl2:
  (nounPhrase_compound |
   determiner_pl? premodifier_pl?
   (pronoun_pl2 | noun_pl | noun_pl_possessive)
  )
  postmodifier?;

nounPhrase_pl3:
  (nounPhrase_compound |
   determiner_pl? premodifier_pl?
   (pronoun_pl3 | noun_pl | noun_pl_possessive)
  )
  postmodifier?;

nounPhrase_compound:
  (nounPhrase_compound0 (And | Or | And SLASH Or) nounPhrase_compound0 |
   nounPhrase_compound0 COMMA (nounPhrase_compound0 COMMA)+ (And | Or | And SLASH Or) nounPhrase_compound0
  );

nounPhrase_compound0:
  determiner? premodifier?
  (pronoun_sg | pronoun_pl | noun_sg | noun_pl | noun_sg_possessive | noun_pl_possessive);
