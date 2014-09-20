parser grammar AbilityParser;

action:
  drawCards PERIOD;

activatedAbility:
  activationCost (COMMA activationCost)* COLON action+;

activationCost:
  TAP |
  UNTAP |
  MANA |
  drawCards;

triggeredAbility:
  EOF;

staticAbility:
  EOF;
  