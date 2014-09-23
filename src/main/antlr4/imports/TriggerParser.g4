parser grammar TriggerParser;

trigger:
  etbTrigger |
  ltbTrigger;

etbTrigger:
  (When | Whenever) singularObjectExpression Enters The Battlefield;

ltbTrigger:
  (When | Whenever) singularObjectExpression Leaves The Battlefield;
