/**
 * WordsGenerator.java
 * 
 * Created on 21.09.2014
 */

package net.slightlymagic.laterna.oracle.tools;


import java.io.IOException;
import java.io.PrintStream;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


/**
 * <p>
 * {@code WordsGenerator}
 * </p>
 * 
 * @version V0.0 21.09.2014
 * @author SillyFreak
 */
public class WordsGenerator {
    public static void main(String[] args) throws IOException {
        List<Card> content = AbilityExtractor.readSer();
        Pattern word = Pattern.compile("(~'s)|(\\{\\w+(?:/\\w+)*\\})|(\\p{IsLetter}+(?:'\\p{IsLetter}+)*'?)");
        Set<String> words = new TreeSet<String>();
        StringBuffer sb = new StringBuffer();
        for(Card c:content) {
            for(Ability a:c.abilities) {
                a.num++;
                if(a.num == 0 && a.text.length() > 1) {
                    sb.setLength(0);
                    Matcher m = word.matcher(a.text.toLowerCase());
                    while(m.find()) {
                        m.appendReplacement(sb, "");
                        if(m.group(3) != null) {
                            words.add(m.group());
                        }
                    }
                    m.appendTail(sb);
                    
                    String rest = sb.toString().replaceAll("[ ,.;:+/0-9~()—\"-]", "");
                    if(!rest.isEmpty()) System.out.println(rest + " <> " + a.text);
                }
            }
        }
        
//        PrintStream out = new PrintStream("src/main/antlr4/imports/WordsLexer.g4");
        PrintStream out = System.out;
        out.println("lexer grammar WordsLexer");
        out.println();
        Set<String> ids = new TreeSet<String>();
        for(String w:words) {
            String id = (w.substring(0, 1).toUpperCase() + w.substring(1)).replaceAll("\\P{IsLetter}", "_");
            if(!ids.add(id)) System.err.println("duplicate id: " + id);
            out.printf("%s: '%s';%n", id, w.replaceAll("'", "\\'"));
        }
    }
}
