/**
 * WordMapping.java
 * 
 * Created on 21.09.2014
 */

package net.slightlymagic.laterna.oracle.grammar;


import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.HashMap;
import java.util.Map;


/**
 * <p>
 * {@code WordMapping}
 * </p>
 * 
 * @version V0.0 21.09.2014
 * @author SillyFreak
 */
public class WordMapping {
    private static final Map<String, Integer> fields = new HashMap<String, Integer>();
    private static final Map<String, Integer> words  = new HashMap<String, Integer>();
    
    static {
        for(Field f:OracleLexer.class.getFields()) {
            if(f.getType() == int.class && Modifier.isPublic(f.getModifiers())
                    && Modifier.isStatic(f.getModifiers()) && Modifier.isFinal(f.getModifiers())) {
                try {
                    fields.put(f.getName(), (Integer) f.get(null));
                } catch(IllegalArgumentException | IllegalAccessException ex) {
                    throw new AssertionError(ex);
                }
            }
        }
    }
    
    public static int getTokenTypeForWord(String word) {
        Integer result = words.get(word);
        if(result == null) {
            result = fields.get((word.substring(0, 1).toUpperCase() + word.substring(1)).replaceAll(
                    "\\P{IsLetter}", "_"));
            if(result == null) throw new IllegalArgumentException("unmatched word: " + word);
            words.put(word, result);
        }
        return result;
    }
}
