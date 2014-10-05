parser grammar ContinuousEffectsParser;

continuousEffect:
  pumpEffect;

pumpEffect_pt:
  (Get | Gets) ptPump;

pumpEffect_ability:
  keywordAbility | QUOTED;

pumpEffect_keyword:
  (Have | Has | Gain | Gains) (
    pumpEffect_ability |
    pumpEffect_ability (And | Or) pumpEffect_ability |
    pumpEffect_ability COMMA (pumpEffect_ability COMMA)+ (And | Or) pumpEffect_ability
  );

pumpEffect:
  nounPhrase pumpEffect_keyword |
  nounPhrase pumpEffect_pt (And pumpEffect_keyword)?;
