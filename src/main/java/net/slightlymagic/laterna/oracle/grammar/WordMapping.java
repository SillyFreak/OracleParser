/**
 * WordMapping.java
 * 
 * Created on 21.09.2014
 */

package net.slightlymagic.laterna.oracle.grammar;


/**
 * <p>
 * {@code WordMapping}
 * </p>
 * 
 * @version V0.0 21.09.2014
 * @author SillyFreak
 */
public class WordMapping {
    public static int getTokenTypeForWord(String word) {
        return OracleLexer.WORD;
    }
}
