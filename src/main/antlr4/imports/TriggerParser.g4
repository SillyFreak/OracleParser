parser grammar TriggerParser;

trigger:
  etbTrigger |
  ltbTrigger |
  phaseTrigger;

etbTrigger:
  (When | Whenever) singularObjectExpression Enters The Battlefield;

ltbTrigger:
  (When | Whenever) singularObjectExpression Leaves The Battlefield;

phaseOrStep:
  Upkeep #Upkeep |
  Main Phase #MainPhase |
  Precombat Main Phase #PrecombatMainPhase |
  Postcombat Main Phase #PostcombatMainPhase |
  End Step #EndStep |
  Cleanup Step #CleanupStep;

phaseTrigger:
  At The Beginning Of (
    Combat (On Your Turn)? |
    (The | Your| Each (Player_s | Opponent_s)) Next? phaseOrStep
  );
