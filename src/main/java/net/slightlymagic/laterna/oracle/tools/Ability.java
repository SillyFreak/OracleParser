/**
 * Ability.java
 * 
 * Created on 11.11.2011
 */

package net.slightlymagic.laterna.oracle.tools;


import java.io.Serializable;


public class Ability implements Serializable {
    private static final long serialVersionUID = -1780253934853333378L;
    
    public final String       text;
    
    /**
     * The number of times this ability was already processed. If -1, the ability must be processed to see if it's
     * supported. After a test run, the number shows how many duplicates of the ability there are in Magic.
     */
    public int                num              = -1;
    /**
     * States whether the ability is supported after processing it ({@code num > -1}). If there was no error, the
     * value is {@code null}.
     */
    public Exception          error            = null;
    
    public Ability(String text) {
        this.text = text;
    }
}
