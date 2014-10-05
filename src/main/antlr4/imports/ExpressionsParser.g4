parser grammar ExpressionsParser;

import
	NounPhraseParser,
	NumeralParser;


subject_sg3:
  nounPhrase_sg3;

subject_other:
  nounPhrase_sg1 | nounPhrase_sg2 | nounPhrase_pl;
