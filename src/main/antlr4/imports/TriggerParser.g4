parser grammar TriggerParser;

trigger:
  etbTrigger;

etbTrigger:
  When SELF Enters The Battlefield;
