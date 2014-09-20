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
  trigger COMMA action+;

trigger:
  EOF;

staticAbility:
  EOF;
  