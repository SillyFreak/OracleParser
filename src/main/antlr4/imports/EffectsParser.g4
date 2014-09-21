parser grammar AbilityParser;

effect:
  drawCards;

drawCards:
  Draw numberWord (Card | Cards);
