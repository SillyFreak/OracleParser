parser grammar ContinuousEffectsParser;

continuousEffect:
  abilityPumpEffect |
  ptPumpEffect;

abilityPumpEffect:
  objectExpression (Have | Has) keywordAbility PERIOD;

ptPumpEffect:
  objectExpression (Get | Gets) ptPump PERIOD;
