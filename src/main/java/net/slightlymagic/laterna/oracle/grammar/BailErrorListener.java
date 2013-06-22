/**
 * BailErrorListener.java
 * 
 * Created on 23.06.2013
 */

package net.slightlymagic.laterna.oracle.grammar;


import org.antlr.v4.runtime.BaseErrorListener;
import org.antlr.v4.runtime.RecognitionException;
import org.antlr.v4.runtime.Recognizer;
import org.antlr.v4.runtime.misc.ParseCancellationException;


/**
 * <p>
 * {@code BailErrorListener}
 * </p>
 * 
 * @version V0.0 23.06.2013
 * @author Clemens Koza
 */
public class BailErrorListener extends BaseErrorListener {
    @Override
    public void syntaxError(Recognizer<?, ?> recognizer, Object offendingSymbol, int line, int charPositionInLine, String msg, RecognitionException e) {
        throw new ParseCancellationException(e);
    }
}
