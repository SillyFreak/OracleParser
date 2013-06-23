/**
 * OracleParserTest.java
 * 
 * Created on 23.06.2013
 */

package net.slightlymagic.laterna.oracle.grammar;


import net.slightlymagic.laterna.oracle.grammar.OracleParser.LineContext;

import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.BailErrorStrategy;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTreeWalker;


/**
 * <p>
 * {@code OracleParserTest}
 * </p>
 * 
 * @version V0.0 23.06.2013
 * @author Clemens Koza
 */
public class OracleParserTest {
    public static void main(String[] args) throws Exception {
        process("Double Strike");
        process("Defender");
        process("Bushido 2");
        process("cycling {2}");
    }
    
    private static void process(String ability) throws Exception {
        OracleLexer lexer = new OracleLexer(new ANTLRInputStream(ability.toLowerCase()));
        lexer.removeErrorListeners();
        lexer.addErrorListener(new BailErrorListener());
        
        OracleParser parser = new OracleParser(new CommonTokenStream(lexer));
        parser.removeErrorListeners();
        parser.setErrorHandler(new BailErrorStrategy());
        
        LineContext line = parser.line();
        
        ParseTreeWalker w = new ParseTreeWalker();
        w.walk(new TestOracleListener(parser), line);
    }
}
