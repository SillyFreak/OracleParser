parser grammar AbilityParser;

effect:
  addMana |
  discardCards |
  drawCards |
  gainLife;

addMana:
  Add MANA To Your Mana Pool;

discardCards:
  Discard numberWord (Card | Cards);

drawCards:
  Draw numberWord (Card | Cards);

gainLife:
  You Gain number Life;
