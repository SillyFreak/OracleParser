parser grammar NounPhraseParser;

determiner_sg:
	A | An | Each Other? |
	Another | (Up To)? numeral_sg Other? |
	(Another | (Up To)? numeral_sg Other? |) Target |
	This | That;
determiner_pl:
	Other | All Other? |
	(Up To)? numeral_pl Other? |
	(Up To)? numeral_pl Other? Target |
	Those;
determiner_possessive:
	Your | His | Her | His Or Her | Its | Their;

pronoun:
  pronoun_nominative | pronoun_oblique | pronoun_reflexive;
pronoun_nominative:	You | He | She | He Or She | They;
pronoun_oblique:	You | Him | Her | Him Or Her | Them;
pronoun_reflexive:	Himself | Itself;

