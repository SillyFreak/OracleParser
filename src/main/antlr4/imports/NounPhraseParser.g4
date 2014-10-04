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
