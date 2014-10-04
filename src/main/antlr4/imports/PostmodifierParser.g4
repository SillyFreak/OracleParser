parser grammar PostmodifierParser;

postmodifier:
  controllerModifier |
  withKeywordModifier;

controllerModifier:
  (subject_other Control | subject_sg3 Controls);

withKeywordModifier:
  With Flying; //TODO
