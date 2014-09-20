parser grammar AbilityParser;

action:
  drawCards PERIOD;

activatedAbility:
  activatedAbilityCost (COMMA activatedAbilityCost)* COLON action+;

activatedAbilityCost:
  TAP |
  UNTAP |
  MANA |
  drawCards;

triggeredAbility:
  EOF;

staticAbility:
  EOF;
  