/**
 * Oracle.java
 * 
 * Created on 04.10.2014
 */

package net.slightlymagic.laterna.oracle.tools;


import java.io.Serializable;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;


/**
 * <p>
 * {@code Oracle}
 * </p>
 * 
 * @version V0.0 04.10.2014
 * @author SillyFreak
 */
public class Oracle implements Serializable {
    private static final long         serialVersionUID = 2685733609657464618L;
    
    public final Map<String, Ability> abilities;
    public final List<Card>           cards;
    
    public Oracle() {
        this.abilities = new LinkedHashMap<>();
        this.cards = new LinkedList<>();
    }
    
    public static class Ability implements Serializable {
        private static final long serialVersionUID = 3022581628686223781L;
        
        public final String       text;
        public int                count            = 0;
        public Exception          error            = null;
        
        public Ability(String text) {
            this.text = text;
        }
    }
    
    public static class Card implements Serializable {
        private static final long          serialVersionUID = 3628194698183010752L;
        
        public final String                name;
        public final List<AbilityInstance> abilities;
        
        public Card(String name) {
            this.name = name;
            this.abilities = new LinkedList<>();
        }
    }
    
    public static class AbilityInstance implements Serializable {
        private static final long serialVersionUID = 2218164526872460419L;
        
        public final Ability      ability;
        public final int          num;
        
        public AbilityInstance(Ability ability) {
            this.ability = ability;
            this.num = ability.count++;
        }
    }
}
