/**
 * OracleTest.java
 * 
 * Created on 17.10.2011
 */

package net.slightlymagic.laterna.oracle.grammar;


import static java.lang.String.*;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.List;
import java.util.Locale;

import net.slightlymagic.laterna.oracle.grammar.OracleParser.LineContext;
import net.slightlymagic.laterna.oracle.tools.Ability;
import net.slightlymagic.laterna.oracle.tools.Card;

import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.BailErrorStrategy;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.RecognitionException;
import org.junit.Ignore;
import org.junit.Test;


/**
 * <p>
 * The class OracleTest.
 * </p>
 * 
 * @version V0.0 17.10.2011
 * @author Clemens Koza
 */
public class OracleTest {
    
    private void process(String ability) throws Exception {
        OracleLexer lexer = new OracleLexer(new ANTLRInputStream(ability.toLowerCase()));
        lexer.removeErrorListeners();
        lexer.addErrorListener(new BailErrorListener());
        
        OracleParser parser = new OracleParser(new CommonTokenStream(lexer));
        parser.removeErrorListeners();
        parser.setErrorHandler(new BailErrorStrategy());
        
        LineContext line = parser.line();
        System.out.println(line.toStringTree(parser));
    }
    
    @Test
    @Ignore
    public void testSomeAbilities() throws Exception {
        process("Flying");
        process("Double Strike");
        System.out.println("OK");
    }
    
    @SuppressWarnings("unchecked")
    @Test(expected = AssertionError.class)
    public void testAllAbilities() throws Exception {
        //results
        long time;
        String outputs = null;
        
        int abFail = 0, dFail = 0, cFail = 0;
        int abSuccess = 0, dSuccess = 0, cSuccess = 0;
        int abTotal, dTotal, cTotal;
        
        try {
            List<Card> cards;
            { //input
                ObjectInputStream ois = null;
                try {
                    InputStream is = Thread.currentThread().getContextClassLoader().getResourceAsStream(
                            "net/slightlymagic/laterna/oracle/cards.ser");
                    ois = new ObjectInputStream(is);
                    cards = (List<Card>) ois.readObject();
                } finally {
                    if(ois != null) ois.close();
                }
            }
            { //processing
                long begin, end;
                begin = System.nanoTime();
                for(Card c:cards) {
                    for(Ability ab:c.abilities) {
                        if(ab.num == -1) {
                            ab.num = 0;
                            try {
                                process(ab.text);
                            } catch(Exception ex) {
                                ab.error = ex;
                            }
                        }
                        if(ab.error != null) {
                            c.success = false;
                        }
                    }
                }
                end = System.nanoTime();
                time = end - begin;
            }
            { //writing
                StringWriter sw = new StringWriter(1800000); //expected output file size
                PrintWriter out = new PrintWriter(sw);
                
                for(Card c:cards) {
                    out.printf("%s: %s%n", c.name, c.success);
                    if(c.success) cSuccess++;
                    else cFail++;
                    for(Ability ab:c.abilities) {
                        ab.num++;
                        if(ab.error == null) {
                            if(ab.num == 1) abSuccess++;
                            dSuccess++;
                            out.printf("%4d Success: %s%n", ab.num, ab.text);
                        } else {
                            if(ab.num == 1) abFail++;
                            dFail++;
                            out.printf("%4d Failed:  %s%n", ab.num, ab.text);
                            if(!(ab.error instanceof RecognitionException)) {
                                out.print("error: ");
                                ab.error.printStackTrace(out);
                            }
                        }
                    }
                }
                
                //analysis
                abTotal = abSuccess + abFail;
                dTotal = dSuccess + dFail;
                cTotal = cSuccess + cFail;
                
                out.println();
                analyze(out, "Abilities", abTotal, abSuccess, abFail);
                analyze(out, "With dups", dTotal, dSuccess, dFail);
                analyze(out, "Cards", cTotal, cSuccess, cFail);
                out.println();
                String format = "%.1f s for %d abilities (%d ns per ability)%n";
                out.printf(Locale.ENGLISH, format, time / 1000000000d, abTotal, time / abTotal);
                
                //cleanup
                out.close();
                outputs = sw.toString();
            }
            
            if(abFail > 0) throw new AssertionError(format("%d of %d abilities failed", abFail, abTotal));
            
        } finally {
            if(outputs == null) {
                System.out.println("Error - no data collected");
            } else {
                //output
                File file;
                for(int i = 0; (file = new File(format("reports/%02d0/report-%03d.txt", i / 10, i))).exists(); i++);
                System.out.println("writing to " + file.getAbsolutePath());
                file.getParentFile().mkdirs();
                BufferedWriter w = new BufferedWriter(new FileWriter(file));
                try {
                    w.write(outputs);
                } finally {
                    w.close();
                }
            }
        }
    }
    
    private static void analyze(PrintWriter out, String what, int total, int success, int fail) {
        String format = "%-11s%5d; Successful: %5d, Failed: %5d (%.1f%%)%n";
        out.printf(Locale.ENGLISH, format, what + ":", total, success, fail, 100d * success / total);
    }
    
//    public static Tree ability(String ability) throws RecognitionException {
//        try {
//            return (Tree) OracleFactory.ability(string(ability)).getTree();
//        } catch(WrapperException ex) {
//            throw ex.rethrow(RecognitionException.class);
//        }
//    }
//    
//    public static void assertToken(int token, String expected, String text, String[] tokenNames) throws Exception {
//        Assert.assertToken("On token " + tokenNames[token] + ": ", token, text, scan(text));
//    }
}
