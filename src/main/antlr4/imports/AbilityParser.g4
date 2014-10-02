parser grammar AbilityParser;

action:
  (oneShotEffect PERIOD)+;

activatedAbility:
  activationCost (COMMA activationCost)* COLON (oneShotEffect PERIOD)+;

activationCost:
  TAP |
  UNTAP |
  MANA |
  oneShotEffect;

triggeredAbility:
  trigger COMMA (oneShotEffect PERIOD)+;

staticAbility:
  continuousEffect PERIOD;
