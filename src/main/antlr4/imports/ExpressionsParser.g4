parser grammar ExpressionsParser;

singularNumberExpression:
  A | An | One |
  (NUMBER {"1".equals(getRuleContext().getText())}?);

pluralNumberExpression:
  VARIABLE |
  (NUMBER {!"1".equals(getRuleContext().getText())}?) |
  Two | Three | Four | Five |
  Six | Seven | Eight | Nine | Ten;

number:
  NUMBER | VARIABLE;
