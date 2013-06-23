/**
 * TestOracleListener.java
 * 
 * Created on 23.06.2013
 */

package net.slightlymagic.laterna.oracle.grammar;


import net.slightlymagic.laterna.oracle.grammar.OracleParser.CyclingContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.MediumKeywordAbilityContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.SimpleKeywordAbilityContext;

import org.antlr.v4.runtime.Parser;
import org.antlr.v4.runtime.RuleContext;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.RuleNode;
import org.antlr.v4.runtime.tree.TerminalNode;


/**
 * <p>
 * {@code TestOracleListener}
 * </p>
 * 
 * @version V0.0 23.06.2013
 * @author Clemens Koza
 */
public class TestOracleListener extends OracleParserBaseListener {
    private final Parser p;
    
    public TestOracleListener(Parser p) {
        this.p = p;
    }
    
    @Override
    public void enterSimpleKeywordAbility(SimpleKeywordAbilityContext ctx) {
        System.out.println(getName(ctx));
    }
    
    @Override
    public void enterMediumKeywordAbility(MediumKeywordAbilityContext ctx) {
        System.out.println(getName(ctx.mediumKeyword()) + " " + ctx.number().getText());
    }
    
    @Override
    public void enterCycling(CyclingContext ctx) {
        System.out.println("cycling " + ctx.keywordCost().getText());
    }
    
    private String getName(ParseTree tree) {
        assert tree.getChildCount() == 1;
        tree = tree.getChild(0);
        
        if(tree instanceof RuleNode) {
            RuleContext rule = ((RuleNode) tree).getRuleContext();
            return p.getRuleNames()[rule.getRuleIndex()];
        } else if(tree instanceof TerminalNode) {
            Token token = ((TerminalNode) tree).getSymbol();
            String name = p.getTokenNames()[token.getType()];
            return name.substring(1, name.length() - 1);
        } else {
            throw new AssertionError(tree);
        }
    }
}
