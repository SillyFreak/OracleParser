parser grammar QualityParser;

quality:
  colorQuality |
  Basic;

colorQuality:
  color |
  noncolor |
  Colorless |
  Monocolored |
  Multicolor;

color:
  White | Blue | Black | Red | Green;

noncolor:
  Non color;
  