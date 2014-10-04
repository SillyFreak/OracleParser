/**
 * OracleParserTest.java
 * 
 * Created on 23.06.2013
 */

package net.slightlymagic.laterna.oracle.grammar;


import static java.lang.String.*;
import static java.util.Arrays.*;
import static java.util.Collections.*;

import java.io.File;
import java.io.PrintStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import net.slightlymagic.laterna.oracle.grammar.OracleParser.LineContext;
import net.slightlymagic.laterna.oracle.tools.Ability;
import net.slightlymagic.laterna.oracle.tools.AbilityExtractor;
import net.slightlymagic.laterna.oracle.tools.Card;

import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.BailErrorStrategy;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.RecognitionException;
import org.antlr.v4.runtime.misc.ParseCancellationException;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeWalker;
import org.antlr.v4.runtime.tree.TerminalNode;


/**
 * <p>
 * {@code OracleParserTest}
 * </p>
 * 
 * @version V0.0 23.06.2013
 * @author Clemens Koza
 */
public class OracleParserTest {
    private static final List<String> ruleNames = unmodifiableList(asList(OracleParser.ruleNames));
    
    public static void main(String[] args) throws Exception {
        process(AbilityExtractor.readSer());
        
//        process(parse("Other creatures you control with flying get +0/+1."));
//        process(parse("Destroy two target artifacts and/or enchantments."));
    }
    
    private static void process(List<Card> content) throws Exception {
        String datetime = new SimpleDateFormat("yyyyMMdd-HHmmss").format(new Date());
        new File("reports").mkdirs();
        try (PrintStream cards = new PrintStream("reports/cards-" + datetime + ".txt");
                PrintStream abilities = new PrintStream("reports/abilities-" + datetime + ".txt");) {
            
            int cSucc = 0, cErr = 0;
            int aSucc = 0, aErr = 0;
            
            StringBuilder sb = new StringBuilder();
            for(Card c:content) {
                sb.setLength(0);
                sb.append(format("  %s%n", c.name));
                
                for(Ability a:c.abilities) {
                    a.num++;
                    if(a.num == 0) {
                        process(a);
                        abilities.printf("%s %s%n", a.error == null? ' ':'x', a.text);
                        if(a.error == null) aSucc++;
                        else aErr++;
                    }
                    
                    if(a.error != null) c.success = false;
                    sb.append(format("%s  %4d: %s%n", a.error == null? ' ':'x', a.num, a.text));
                }
                cards.printf("%s %s:%n", c.success? ' ':'x', c.name);
                if(c.success) cSucc++;
                else cErr++;
                
                sb.setCharAt(0, c.success? ' ':'x');
                System.out.println(sb);
            }
            String cResult = result("cards", cSucc, cSucc + cErr);
            System.out.println(cResult);
            cards.println(cResult);
            String aResult = result("unique abilities", aSucc, aSucc + aErr);
            System.out.println(aResult);
            abilities.println(aResult);
        }
    }
    
    private static String result(String type, int succ, int total) {
        return format("%d of %d %s parsed: %.2f%%", succ, total, type, 100. * succ / total);
    }
    
    private static void process(Ability ability) {
        try {
            process(ability.text);
        } catch(ParseCancellationException ex) {
            if(ex.getCause() instanceof Exception) ability.error = (Exception) ex.getCause();
            else ability.error = ex;
        } catch(RecognitionException ex) {
            ability.error = ex;
        }
    }
    
    private static void process(String ability) throws RecognitionException {
        try {
            ParseTree t = parse(ability);
            new ParseTreeWalker().walk(new OracleParserBaseListener() {
                @Override
                public void visitTerminal(TerminalNode node) {
                    if(node.getSymbol().getType() != OracleParser.QUOTED) return;
                    String ability = node.getSymbol().getText();
                    ability = ability.substring(1, ability.length() - 1);
                    process(ability);
                }
            }, t);
        } catch(ParseCancellationException | RecognitionException ex) {
            throw ex;
        } catch(RuntimeException ex) {
            System.err.println(ability);
            throw ex;
        }
    }
    
    private static OracleParser parser(String ability) throws RecognitionException {
        OracleLexer lexer = new OracleLexer(
                new ANTLRInputStream(ability.toLowerCase().replaceAll("\\.\"", ".\".")));
        lexer.removeErrorListeners();
        lexer.addErrorListener(new BailErrorListener());
        
        OracleParser parser = new OracleParser(new CommonTokenStream(lexer));
        parser.removeErrorListeners();
        parser.setErrorHandler(new BailErrorStrategy());
        return parser;
    }
    
    private static LineContext parse(String ability) throws RecognitionException {
        return parser(ability).line();
    }
    
    private static void process(ParserRuleContext ctx) throws Exception {
        System.out.println(ctx.toStringTree(ruleNames));
        ctx.inspect(ruleNames);
    }
}
