parser grammar CounterParser;

counterType:
  ptCounter |
  Age | Aim | Arrowhead | Awakening |
  Blaze | Blood | Bribery |
  Carrion | Charge | Corpse | Credit | Cube | Currency |
  Death | Delay | Depletion | Devotion | Divinity | Doom | Dream |
  Echo | Elixir | Energy | Eon |
  Fade | Fate | Feather | Flame | Flood | Fungus | Fuse |
  Glyph | Growth |
  Hatchling | Healing | Hoofprint | Hourglass | Hunger | Husk |
  Ice | Infection | Intervention |
  Javelin |
  Ki |
  Level | Lore | Loyalty | Luck |
  Magnet | Mannequin | Matrix | Mine | Mining | Mire | Music |
  Net |
  Ore |
  Page | Pain | Paralyzation | Petal | Phylactery | Pin | Plague | Poison | Pressure |
  Quest |
  Scream | Shell | Shield | Sleep | Slime | Soot | Spore | Storage | Strife | Study |
  Theft | Tide | Time | Tower | Training | Trap | Treasure |
  Velocity | Verse | Vitality |
  Wage | Winch | Wind | Wish;

ptCounter:
  (NUMBER | (PLUS|MINUS)? VARIABLE)
  SLASH
  (NUMBER | (PLUS|MINUS)? VARIABLE);
