parser grammar TriggerParser;

trigger:
  etbTrigger |
  ltbTrigger |
  phaseTrigger;

etbTrigger:
  (When | Whenever) nounPhrase_sg Enters The Battlefield;

ltbTrigger:
  (When | Whenever) nounPhrase_sg Leaves The Battlefield;

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
