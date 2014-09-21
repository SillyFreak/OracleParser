parser grammar CounterParser;

counterType:
  ptCounter |
  Charge;

ptCounter:
  (NUMBER | (PLUS|MINUS)? VARIABLE)
  SLASH
  (NUMBER | (PLUS|MINUS)? VARIABLE);
