/**
 * Card.java
 * 
 * Created on 11.11.2011
 */

package net.slightlymagic.laterna.oracle.tools;


import static java.util.Collections.*;

import java.io.Serializable;
import java.util.LinkedList;
import java.util.List;


public class Card implements Serializable {
    private static final long   serialVersionUID = 6440462275225416643L;
    
    public final String         name;
    private final List<Ability> abilities0;
    public final List<Ability>  abilities;
    
    public boolean              success          = true;
    
    public Card(String name) {
        this.name = name;
        this.abilities0 = new LinkedList<Ability>();
        this.abilities = unmodifiableList(abilities0);
    }
    
    public void addAbility(Ability ability) {
        abilities0.add(ability);
    }
}
