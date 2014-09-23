parser grammar AbilityParser;

action:
  (effect PERIOD)+;

activatedAbility:
  activationCost (COMMA activationCost)* COLON (effect PERIOD)+;

activationCost:
  TAP |
  UNTAP |
  MANA |
  effect;

triggeredAbility:
  trigger COMMA (effect PERIOD)+;

staticAbility:
  EOF;
  