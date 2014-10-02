parser grammar ContinuousEffectsParser;

continuousEffect:
  pumpEffect;

pumpEffect_pt:
  (Get | Gets) ptPump;

pumpEffect_keyword:
  (Have | Has | Gain | Gains) (
    keywordAbility |
    keywordAbility (And | Or) keywordAbility |
    keywordAbility COMMA (keywordAbility COMMA)+ (And | Or) keywordAbility
  );

pumpEffect:
  objectExpression pumpEffect_keyword |
  objectExpression pumpEffect_pt (And pumpEffect_keyword)?;
