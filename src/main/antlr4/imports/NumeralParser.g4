parser grammar NumeralParser;

number: 		NUMBER | VARIABLE;
number_sg:		NUMBER { "1".equals(getRuleContext().getText())}?;
number_pl:		NUMBER {!"1".equals(getRuleContext().getText())}? | VARIABLE;

numberWord:		numberWord_sg | numberWord_pl;
numberWord_sg:	One;
numberWord_pl:	Two | Three | Four | Five | Six |
				Seven | Eight | Nine | Ten | Twelve |
				Thirteen | Fifteen | Twenty;

numeral:		numeral_sg | numeral_pl;
numeral_sg:		numberWord_sg | number_sg;
numeral_pl:		numberWord_pl | number_pl;

//TODO
singularNumber:	A | An | numeral_sg;
pluralNumber:	numeral_pl;
