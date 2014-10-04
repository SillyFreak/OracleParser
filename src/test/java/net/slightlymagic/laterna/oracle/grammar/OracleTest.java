/**
 * OracleTest.java
 * 
 * Created on 17.10.2011
 */

package net.slightlymagic.laterna.oracle.grammar;


import net.slightlymagic.laterna.oracle.grammar.OracleParser.LineContext;

import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.BailErrorStrategy;
import org.antlr.v4.runtime.CommonTokenStream;
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
