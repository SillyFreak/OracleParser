parser grammar QualityParser;

quality:
  colorQuality |
  Basic;

colorQuality:
  color |
  noncolor |
  Colorless |
  Monocolored |
  Multicolored;

color:
  White | Blue | Black | Red | Green;

noncolor:
  Nonwhite | Nonblue | Nonblack | Nonred | Nongreen;
  