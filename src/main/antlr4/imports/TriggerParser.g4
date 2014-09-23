parser grammar TriggerParser;

trigger:
  etbTrigger |
  ltbTrigger |
  phaseTrigger;

etbTrigger:
  (When | Whenever) singularObjectExpression Enters The Battlefield;

ltbTrigger:
  (When | Whenever) singularObjectExpression Leaves The Battlefield;

phaseTrigger:
  At The Beginning Of Your Upkeep;  
