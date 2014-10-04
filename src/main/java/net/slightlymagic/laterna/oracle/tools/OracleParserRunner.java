/**
 * OracleParserRunner.java
 * 
 * Created on 04.10.2014
 */

package net.slightlymagic.laterna.oracle.tools;


import static java.lang.String.*;
import static java.util.Arrays.*;
import static java.util.Collections.*;

import java.io.File;
import java.io.IOException;
import java.io.PrintStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;

import net.slightlymagic.laterna.oracle.grammar.BailErrorListener;
import net.slightlymagic.laterna.oracle.grammar.OracleLexer;
import net.slightlymagic.laterna.oracle.grammar.OracleParser;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.LineContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParserBaseListener;
import net.slightlymagic.laterna.oracle.tools.Oracle.Ability;
import net.slightlymagic.laterna.oracle.tools.Oracle.AbilityInstance;
import net.slightlymagic.laterna.oracle.tools.Oracle.Card;

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
 * {@code OracleParserRunner}
 * </p>
 * 
 * @version V0.0 04.10.2014
 * @author SillyFreak
 */
public class OracleParserRunner {
    private static final List<String> ruleNames = unmodifiableList(asList(OracleParser.ruleNames));
    private static final int          nThreads  = 8;
    
    public static void main(String[] args) throws RecognitionException, IOException, InterruptedException {
        parseAll();
        
//        process(parse("Other creatures you control with flying get +0/+1."));
//        process(parse("Destroy two target artifacts and/or enchantments."));
    }
    
    private static void parseAll() throws IOException, InterruptedException {
        OracleParserRunner r = new OracleParserRunner(nThreads);
        Oracle oracle = AbilityExtractor.readSer();
        
        long time;
        time = System.nanoTime();
        for(Ability ab:oracle.abilities.values())
            r.submit(ab);
        r.pool.shutdown();
        while(!r.pool.awaitTermination(10, TimeUnit.SECONDS));
        time = System.nanoTime() - time;
        
        System.out.printf("%d ms (%d threads), %d abilities%n", time / 1000000, nThreads, oracle.abilities.size());
        System.out.printf("%.3f ms/ability%n", time * nThreads / oracle.abilities.size() / 1000000d);
        
        
        String datetime = new SimpleDateFormat("yyyyMMdd-HHmmss").format(new Date());
        new File("reports").mkdirs();
        
        try (PrintStream abilities = new PrintStream("reports/abilities-" + datetime + ".txt");) {
            int aSucc = 0, aErr = 0;
            
            for(Ability a:oracle.abilities.values()) {
                if(a.error == null) aSucc++;
                else aErr++;
                
                abilities.printf("%s %s%n", a.error == null? ' ':'x', a.text);
            }
            String aResult = result("unique abilities", aSucc, aSucc + aErr);
            System.out.println(aResult);
            abilities.println(aResult);
        }
        
        try (PrintStream cards = new PrintStream("reports/cards-" + datetime + ".txt");) {
            int cSucc = 0, cErr = 0;
            
            for(Card c:oracle.cards) {
                boolean succ = true;
                for(AbilityInstance a:c.abilities) {
                    if(a.ability.error != null) succ = false;
                }
                if(succ) cSucc++;
                else cErr++;
                
                cards.printf("%s %s:%n", succ? ' ':'x', c.name);
//                for(AbilityInstance a:c.abilities) {
//                    cards.append(format("%s  %4d: %s%n", a.ability.error == null? ' ':'x', a.num, a.ability.text));
//                }
            }
            String cResult = result("cards", cSucc, cSucc + cErr);
            System.out.println(cResult);
            cards.println(cResult);
        }
    }
    
    private static String result(String type, int succ, int total) {
        return format("%d of %d %s parsed: %.2f%%", succ, total, type, 100. * succ / total);
    }
    
    private final ExecutorService pool;
    
    public OracleParserRunner(int nThreads) {
        pool = Executors.newFixedThreadPool(nThreads);
    }
    
    public Future<Ability> submit(final Ability ability) {
        return pool.submit(new Callable<Ability>() {
            public Ability call() throws Exception {
                process(ability);
                return ability;
            }
        });
    }
    
    private static void process(Ability ability) throws RecognitionException {
        try {
            process(ability.text);
        } catch(ParseCancellationException ex) {
            if(ex.getCause() instanceof Exception) ability.error = (Exception) ex.getCause();
            else ability.error = ex;
            throw ex;
        } catch(RecognitionException ex) {
            ability.error = ex;
            throw ex;
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
    
    private static void process(ParserRuleContext ctx) {
        System.out.println(ctx.toStringTree(ruleNames));
        ctx.inspect(ruleNames);
    }
}
