parser grammar AbilityParser;

action:
  effect PERIOD;

activatedAbility:
  activationCost (COMMA activationCost)* COLON action+;

activationCost:
  TAP |
  UNTAP |
  MANA |
  effect;

triggeredAbility:
  trigger COMMA (effect PERIOD)+;

trigger:
  EOF;

staticAbility:
  EOF;
  