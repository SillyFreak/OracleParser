parser grammar AbilityParser;

action:
  EOF;

activatedAbility:
  activatedAbilityCost (COMMA activatedAbilityCost)* COLON (activatedAbilityEffect PERIOD)+;

activatedAbilityCost:
  TAP |
  UNTAP |
  MANA;

activatedAbilityEffect:
  EOF;

triggeredAbility:
  EOF;

staticAbility:
  EOF;
  