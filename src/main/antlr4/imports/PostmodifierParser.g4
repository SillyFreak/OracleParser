parser grammar PostmodifierParser;

postmodifier:
  controllerModifier |
  withKeywordModifier;

controllerModifier:
  (playerSubject Control | player3rdSubject Controls);

withKeywordModifier:
  With Flying; //TODO
