parser grammar PostmodifierParser;

postmodifier:
  controllerModifier;

controllerModifier:
  (playerSubject Control | player3rdSubject Controls);
