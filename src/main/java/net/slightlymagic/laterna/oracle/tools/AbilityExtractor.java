/**
 * AbilityExtractor.java
 * 
 * Created on 19.10.2011
 */

package net.slightlymagic.laterna.oracle.tools;


import static java.util.regex.Pattern.*;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


/**
 * <p>
 * The class AbilityExtractor.
 * </p>
 * 
 * @version V0.0 19.10.2011
 * @author Clemens Koza
 */
public class AbilityExtractor {
    private static final String  main     = "src/main/resources/";
    private static final String  test     = "src/test/resources/";
    private static final String  pkg      = "net/slightlymagic/laterna/oracle/";
    
    private static final String  cardsXml = main + pkg + "cards.xml";
    private static final String  cardsSer = test + pkg + "cards.ser";
    private static final String  cardsTxt = test + pkg + "cards.txt";
    
    private static final Pattern name     = compile("<name>(.*?)</name>");
    private static final Pattern rule     = compile("<rule .*?>(.*?)</rule>");
    
    public static void main(String[] args) throws Exception {
        List<Card> cards;
        
        try (BufferedReader r = new BufferedReader(new FileReader(cardsXml));) {
            cards = new LinkedList<Card>();
            Map<String, Ability> abilities = new HashMap<String, Ability>();
            Card current = null;
            String cardname = null;
            
            for(String s; (s = r.readLine()) != null;) {
                Matcher m;
                if((m = name.matcher(s)).find()) {
                    
                    s = m.group(1);
                    s = s.replaceAll(quote("&apos;"), "'");
                    s = s.replaceAll(quote("&quot;"), "\"");
                    s = s.replaceAll(quote("&amp;"), "&");
                    cards.add(current = new Card(s));
                    
                    //TODO the first variant has many false positives
                    //this is the most twisted one: "Tuktuk the Explorer"
                    //  When ~ dies, put a legendary 5/5 colorless Goblin Golem artifact creature token
                    //  named Tuktuk the Returned onto the battlefield.
                    //        ^^^^^^ this is part of a name!
                    
                    s = "\\Q" + s + "\\E";
//                s = s.replaceFirst("(.*?)((, | of | the ).*)", "$1\\\\E(\\\\Q$2)?");
                    s = s.replaceFirst("(.*?)((, ).*)", "$1\\\\E(\\\\Q$2)?");
                    cardname = s;
                    
                } else if((m = rule.matcher(s)).find()) {
                    
                    if(current == null) throw new AssertionError();
                    s = m.group(1);
                    s = s.replaceAll(quote("&apos;"), "'");
                    s = s.replaceAll(quote("&quot;"), "\"");
                    s = s.replaceAll(quote("&amp;"), "&");
                    
                    s = s.replaceAll(cardname, "~");
                    
                    Ability ab = abilities.get(s);
                    if(ab == null) abilities.put(s, ab = new Ability(s));
                    
                    current.addAbility(ab);
                    
                }
            }
        }
        writeSer(new File(cardsSer), cards);
        writeTxt(new File(cardsTxt), cards);
    }
    
    public static List<Card> readSer() throws IOException {
        return readSer(new File(cardsSer));
    }
    
    @SuppressWarnings("unchecked")
    private static List<Card> readSer(File file) throws IOException {
        try {
            ObjectInputStream is = new ObjectInputStream(new FileInputStream(file));
            List<Card> content = (List<Card>) is.readObject();
            is.close();
            return content;
        } catch(ClassNotFoundException ex) {
            throw new AssertionError(ex);
        }
    }
    
    private static void writeSer(File file, List<Card> content) throws IOException {
        file.getParentFile().mkdirs();
        ObjectOutputStream os = new ObjectOutputStream(new FileOutputStream(file));
        os.writeObject(content);
        os.close();
    }
    
    private static void writeTxt(File file, List<Card> content) throws IOException {
        file.getParentFile().mkdirs();
        BufferedWriter w = new BufferedWriter(new FileWriter(file));
        for(Card c:content) {
            w.write(c.name + ":");
            w.newLine();
            for(Ability ab:c.abilities) {
                w.write(++ab.num + " " + ab.text);
                w.newLine();
            }
        }
        w.close();
    }
}
