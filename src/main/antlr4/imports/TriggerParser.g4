parser grammar TriggerParser;

trigger:
  etbTrigger |
  ltbTrigger;

etbTrigger:
  When SELF Enters The Battlefield;

ltbTrigger:
  When SELF Leaves The Battlefield;
