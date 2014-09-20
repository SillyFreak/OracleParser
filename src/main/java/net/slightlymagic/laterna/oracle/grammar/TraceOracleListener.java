/**
 * TraceOracleListener.java
 * 
 * Created on 25.06.2013
 */

package net.slightlymagic.laterna.oracle.grammar;


import net.slightlymagic.laterna.oracle.grammar.OracleParser.AbsorbContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.ActionContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.ActivatedAbilityContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.AmplifyContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.AnnihilatorContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.AuraSwapContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.BandingContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.BattleCryContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.BloodthirstContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.BushidoContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.BuybackContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.CascadeContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.ChangelingContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.ConspireContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.ConvokeContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.CumulativeUpkeepContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.CyclingContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.DeathtouchContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.DefenderContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.DelveContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.DevourContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.DoubleStrikeContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.DredgeContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.EchoContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.EntwineContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.EpicContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.EquipContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.EvokeContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.ExaltedContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.FadingContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.FearContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.FirstStrikeContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.FlankingContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.FlashContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.FlashbackContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.FlyingContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.FortifyContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.FrenzyContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.GraftContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.GravestormContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.HasteContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.HauntContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.HideawayContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.HorsemanshipContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.InfectContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.IntimidateContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.KeywordAbilityContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.KeywordCostContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.KickerContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.LevelUpContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.LifelinkContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.LineContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.LivingWeaponContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.MadnessContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.ModularContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.MorphContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.MultikickerContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.NinjutsuContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.NumberContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.PersistContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.PhasingContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.PoisonousContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.ProvokeContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.ProwlContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.RampageContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.ReachContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.ReboundContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.RecoverContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.ReplicateContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.RetraceContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.RippleContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.ShadowContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.ShroudContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.SoulshiftContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.SplitSecondContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.StaticAbilityContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.StormContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.SunburstContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.TotemArmorContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.TrampleContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.TransfigureContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.TransmuteContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.TriggeredAbilityContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.UnearthContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.VanishingContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.VigilanceContext;
import net.slightlymagic.laterna.oracle.grammar.OracleParser.WitherContext;

import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ErrorNode;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.TerminalNode;


/**
 * <p>
 * {@code TraceOracleListener}
 * </p>
 * 
 * @version V0.0 25.06.2013
 * @author Clemens Koza
 */
public class TraceOracleListener implements OracleParserListener {
    private int indent = 0;
    
    private void trace(ParseTree node) {
        StackTraceElement[] trace = Thread.currentThread().getStackTrace();
        String method = trace[2].getMethodName();
        
        if(method.startsWith("exit")) indent -= 2;
        
        String fmt = indent <= 0? "%s%s(%s)%n":"%" + indent + "s%s(%s)%n";
        System.out.printf(fmt, "", method, node.getText());
        
        if(method.startsWith("enter")) indent += 2;
    }
    
    @Override
    public void visitTerminal(TerminalNode node) {
        trace(node);
    }
    
    @Override
    public void visitErrorNode(ErrorNode node) {
        trace(node);
    }
    
    @Override
    public void enterEveryRule(ParserRuleContext ctx) {
        trace(ctx);
        indent -= 2;
    }
    
    @Override
    public void exitEveryRule(ParserRuleContext ctx) {
        indent += 2;
        trace(ctx);
    }
    
    @Override
    public void enterKeywordAbility(KeywordAbilityContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitKeywordAbility(KeywordAbilityContext ctx) {
        trace(ctx);
    }
    
    public void enterActivatedAbility(ActivatedAbilityContext ctx) {
        trace(ctx);
    }
    
    public void exitActivatedAbility(ActivatedAbilityContext ctx) {
        trace(ctx);
    }
    
    public void enterTriggeredAbility(TriggeredAbilityContext ctx) {
        trace(ctx);
    }
    
    public void exitTriggeredAbility(TriggeredAbilityContext ctx) {
        trace(ctx);
    }
    
    public void enterStaticAbility(StaticAbilityContext ctx) {
        trace(ctx);
    }
    
    public void exitStaticAbility(StaticAbilityContext ctx) {
        trace(ctx);
    }
    
    public void enterAction(ActionContext ctx) {
        trace(ctx);
    }
    
    public void exitAction(ActionContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterTransmute(TransmuteContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitTransmute(TransmuteContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterSoulshift(SoulshiftContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitSoulshift(SoulshiftContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterDelve(DelveContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitDelve(DelveContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterHideaway(HideawayContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitHideaway(HideawayContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterHaunt(HauntContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitHaunt(HauntContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterHaste(HasteContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitHaste(HasteContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterPersist(PersistContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitPersist(PersistContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterShadow(ShadowContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitShadow(ShadowContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterAbsorb(AbsorbContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitAbsorb(AbsorbContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterBloodthirst(BloodthirstContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitBloodthirst(BloodthirstContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterBuyback(BuybackContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitBuyback(BuybackContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterVanishing(VanishingContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitVanishing(VanishingContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterLevelUp(LevelUpContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitLevelUp(LevelUpContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterCycling(CyclingContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitCycling(CyclingContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterAnnihilator(AnnihilatorContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitAnnihilator(AnnihilatorContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterReplicate(ReplicateContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitReplicate(ReplicateContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterConvoke(ConvokeContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitConvoke(ConvokeContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterGravestorm(GravestormContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitGravestorm(GravestormContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterCumulativeUpkeep(CumulativeUpkeepContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitCumulativeUpkeep(CumulativeUpkeepContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterWither(WitherContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitWither(WitherContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterDoubleStrike(DoubleStrikeContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitDoubleStrike(DoubleStrikeContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterRecover(RecoverContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitRecover(RecoverContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterGraft(GraftContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitGraft(GraftContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterProvoke(ProvokeContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitProvoke(ProvokeContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterSplitSecond(SplitSecondContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitSplitSecond(SplitSecondContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterKeywordCost(KeywordCostContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitKeywordCost(KeywordCostContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterNumber(NumberContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitNumber(NumberContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterInfect(InfectContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitInfect(InfectContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterLifelink(LifelinkContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitLifelink(LifelinkContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterFirstStrike(FirstStrikeContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitFirstStrike(FirstStrikeContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterLivingWeapon(LivingWeaponContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitLivingWeapon(LivingWeaponContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterEquip(EquipContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitEquip(EquipContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterTrample(TrampleContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitTrample(TrampleContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterEcho(EchoContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitEcho(EchoContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterUnearth(UnearthContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitUnearth(UnearthContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterChangeling(ChangelingContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitChangeling(ChangelingContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterVigilance(VigilanceContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitVigilance(VigilanceContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterProwl(ProwlContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitProwl(ProwlContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterRebound(ReboundContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitRebound(ReboundContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterDevour(DevourContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitDevour(DevourContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterDeathtouch(DeathtouchContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitDeathtouch(DeathtouchContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterShroud(ShroudContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitShroud(ShroudContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterFear(FearContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitFear(FearContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterIntimidate(IntimidateContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitIntimidate(IntimidateContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterMultikicker(MultikickerContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitMultikicker(MultikickerContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterConspire(ConspireContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitConspire(ConspireContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterLine(LineContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitLine(LineContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterRampage(RampageContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitRampage(RampageContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterSunburst(SunburstContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitSunburst(SunburstContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterStorm(StormContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitStorm(StormContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterMorph(MorphContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitMorph(MorphContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterAmplify(AmplifyContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitAmplify(AmplifyContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterReach(ReachContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitReach(ReachContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterEvoke(EvokeContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitEvoke(EvokeContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterFlash(FlashContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitFlash(FlashContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterDredge(DredgeContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitDredge(DredgeContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterNinjutsu(NinjutsuContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitNinjutsu(NinjutsuContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterTransfigure(TransfigureContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitTransfigure(TransfigureContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterBushido(BushidoContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitBushido(BushidoContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterAuraSwap(AuraSwapContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitAuraSwap(AuraSwapContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterBanding(BandingContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitBanding(BandingContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterFlashback(FlashbackContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitFlashback(FlashbackContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterMadness(MadnessContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitMadness(MadnessContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterFrenzy(FrenzyContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitFrenzy(FrenzyContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterRetrace(RetraceContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitRetrace(RetraceContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterRipple(RippleContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitRipple(RippleContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterEntwine(EntwineContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitEntwine(EntwineContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterFlying(FlyingContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitFlying(FlyingContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterKicker(KickerContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitKicker(KickerContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterFlanking(FlankingContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitFlanking(FlankingContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterPoisonous(PoisonousContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitPoisonous(PoisonousContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterModular(ModularContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitModular(ModularContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterPhasing(PhasingContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitPhasing(PhasingContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterBattleCry(BattleCryContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitBattleCry(BattleCryContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterTotemArmor(TotemArmorContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitTotemArmor(TotemArmorContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterExalted(ExaltedContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitExalted(ExaltedContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterHorsemanship(HorsemanshipContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitHorsemanship(HorsemanshipContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterFading(FadingContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitFading(FadingContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterFortify(FortifyContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitFortify(FortifyContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterDefender(DefenderContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitDefender(DefenderContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterCascade(CascadeContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitCascade(CascadeContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void enterEpic(EpicContext ctx) {
        trace(ctx);
    }
    
    @Override
    public void exitEpic(EpicContext ctx) {
        trace(ctx);
    }
}
