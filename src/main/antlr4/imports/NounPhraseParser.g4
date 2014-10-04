parser grammar NounPhraseParser;

determiner_sg:
	A | An | Each Other? |
	Another | (Up To)? numeral_sg Other? |
	(Another | (Up To)? numeral_sg Other? |) Target |
	determiner_sg1_possessive | determiner_sp2_possessive | determiner_sg3_possessive |
	determiner_sg_demonstrative;
determiner_pl:
	Other | All Other? |
	(Up To)? numeral_pl Other? |
	(Up To)? numeral_pl Other? Target |
	determiner_pl1_possessive | determiner_sp2_possessive | determiner_pl3_possessive |
	determiner_pl_demonstrative;
determiner_sg1_possessive:	My;
determiner_sp2_possessive:	Your;
determiner_sg3_possessive:	His | Her | Its | Their | His Or Her;
determiner_pl1_possessive:	Our;
determiner_pl3_possessive:	Their;
determiner_sg_demonstrative:	pronoun_sg_demonstrative;
determiner_pl_demonstrative:	pronoun_pl_demonstrative;

pronoun_sg1_nominative:	I;
pronoun_sp2_nominative:	You;
pronoun_sg3_nominative:	He | She | It | They | He Or She;
pronoun_pl1_nominative:	We;
pronoun_pl3_nominative:	They;
pronoun_sg1_oblique:	Me;
pronoun_sp2_oblique:	You;
pronoun_sg3_oblique:	Him | Her | It | They | Him Or Her;
pronoun_pl1_oblique:	Us;
pronoun_pl3_oblique:	Them;
pronoun_sg1_reflexive:	Myself;
pronoun_sg2_reflexive:	Yourself;
pronoun_sg3_reflexive:	Himself | Herself | Itself | Themself | Himself Or Herself;
pronoun_pl1_reflexive:	Ourselves;
pronoun_pl2_reflexive:	Yourselves;
pronoun_pl3_reflexive:	Themselves;
pronoun_sg1_possessive:	Mine;
pronoun_sp2_possessive:	Yours;
pronoun_sg3_possessive:	His | Hers | Its | Theirs | His Or Hers;
pronoun_pl1_possessive:	Ours;
pronoun_pl3_possessive:	Theirs;
pronoun_sg_demonstrative:	This | That;
pronoun_pl_demonstrative:	These | Those;
