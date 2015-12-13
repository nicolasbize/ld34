package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxPoint;
import flixel.util.FlxRandom;
import flixel.text.FlxText;
import haxe.Timer;

/**
 * A FlxState which can be used for the game's arena.
 */
class ArenaState extends FlxState
{

    public var executer:Executer = null;
    public var aimPanel:AimPanel = null;
    private var currentGold:Int = 0;
    private var currentMission:Int = 1;
    public var windDirection:Int = 0;
    public var wind:Wind = null;
    public var windIntensity = 0;
    public var windText:WindText = null;
    public var reticle:Reticle = null;
    public var power:PowerGauge = null;
    public var arrows:Array<Arrow> = new Array<Arrow>();
    public var smallBloods:Array<SmallBlood> = new Array<SmallBlood>();
    public var explosions:Array<Explosion> = new Array<Explosion>();
    public var frontVictim:FrontVictim = null;
    public var sideVictim:SideVictim = null;
    public var hitText:HitText = null;
    private var powerToggle:Int = 94;
    private var victimLife = 10;
    private var scoreBoard:Tuto = null;
    private var arrowsUsed:Int = 0;
    private var totalTime:Int = 0;
    private var bonusHead:Bool = false;
    private var bonusLeftArm:Bool = false;
    private var bonusRightArm:Bool = false;
    private var bonusLeftLeg:Bool = false;
    private var bonusRightLeg:Bool = false;
    private var currentStep:Int = 0;
    private var x:Tuto = null;
    private var timer:Int = 0;
    private var blackScreen:Tuto = null;
    private var king:FlxSprite = null;
    private var kingDead:Bool = false;
    private var hasEnded = false;

    public function new(gold:Int, mission:Int) {
        currentGold = gold;
        currentMission = mission;
        super();
    }

    override public function create():Void
    {
        FlxG.log.redirectTraces = true;
        FlxG.watch.addMouse();

        this.add(new FlxSprite().loadGraphic("assets/sprite/arena.png", false));
        aimPanel = new AimPanel(69, 37);
        aimPanel.arena = this;
        executer = new Executer();
        wind = new Wind(73, 99);
        windText = new WindText(83, 99);
        reticle = new Reticle(0, 0);
        power = new PowerGauge(0, 0);
        power.arena = this;
        executer.arena = this;
        frontVictim = new FrontVictim(0, 0);
        sideVictim = new SideVictim(0, 0);
        hitText = new HitText(0, 0);
        hitText.arena = this;
        this.add(sideVictim);
        this.add(executer);
        // executer.getInPosition();
        totalTime = 0;

        createArrow(95, "head");

        super.create();
    }

    override public function update():Void {
        super.update();
        totalTime++;
        timer++;
        if (currentStep == 1 && timer > 40 && FlxG.keys.anyPressed(["X"])) {
            blackScreen = new Tuto(0, 0, "black");
            this.add(blackScreen);
            Timer.delay(loadTavern, currentMission < 5 ? 1000 : 2000);
        }
    }

    private function loadTavern() {
        if (currentMission < 5) {
            FlxG.switchState(new TavernState(currentGold, currentMission + 1));
        } else {
            // ending
            if (!hasEnded) {
                hasEnded = true;
                if (!kingDead) {
                    this.add(new Tuto(0, 0, "end-evil"));
                } else {
                    this.add(new Tuto(0, 0, "end-good"));
                }
                Timer.delay(showTotalScore, 1000);
            }
        }
    }

    private function showTotalScore(): Void {
        this.add(new FlxText(126, 79, 26, Std.string(currentGold), 8));
    }

    public function aim():Void {
        windDirection = FlxRandom.intRanged(0, 3);
        windIntensity = FlxRandom.intRanged(3, 20);
        if (currentMission == 5) {
            windDirection = 1;
            windIntensity = 30;
        }
        this.add(aimPanel);
        wind.setDir(windDirection);
        this.add(wind);
        windText.setValue(windIntensity);
        this.add(windText);
        this.add(frontVictim);
        if (currentMission == 5) {
            king = new FlxSprite(122, 64);
            king.loadGraphic("assets/sprite/frontking.png", false);
            this.add(king);
        }
        this.add(reticle);
        this.add(power);
    }

    public function startShooting():Void {
        power.start();
    }

    public function stopShooting():Void {
        power.stop();
    }

    public function completeShot(): Void {
        reticle.freeze();
        Timer.delay(stopAim, 1000);
    }

    private function stopAim():Void {
        this.remove(aimPanel);
        this.remove(wind);
        this.remove(windText);
        this.remove(reticle);
        this.remove(power);
        this.remove(frontVictim);
        this.remove(king);
        var adjustedReticle = getAdjustedReticlePos();
        var hit = getHitBodyPart(getAdjustedReticlePos());
        createArrow(power.getValue(), hit);
        executer.animation.play("shoot");
    }

    private function createArrow(pow:Float, hit:String):Arrow {
        var arrow = new Arrow(29, 81);
        arrow.willHit = hit;
        arrow.arena = this;
        handleHits(arrow, pow);
        arrows.push(arrow);
        this.add(arrow);
        arrowsUsed += 1;
        return arrow;
    }

    private function handleHits(arrow:Arrow, pow:Float): Void {
        if (pow >= powerToggle && arrow.willHit != "torso") {
            arrow.setPowered();
        }
        if (arrow.willHit == "") {
            arrow.velocity.x =  40 + pow * 2.5;
        } else if (arrow.willHit == "head" || arrow.willHit == "rightarm") {
            hitHeadArea(arrow, pow);
        } else if (arrow.willHit == "torso") {
            hitTorsoArea(arrow, pow);
        } else if (arrow.willHit == "leftarm") {
            hitLeftArmArea(arrow, pow);
        } else if (arrow.willHit == "leftleg") {
            hitLeftLegArea(arrow, pow);
        } else if (arrow.willHit == "rightleg") {
            hitRightLegArea(arrow, pow);
        }
    }

    private function hitHeadArea(arrow:Arrow, pow:Float): Void {
        if (pow < powerToggle) {
            arrow.velocity.y = -20;
            arrow.velocity.x = 240;
            arrow.angle = -15;
        } else {
            arrow.velocity.y = -15;
            arrow.velocity.x = 310;
            arrow.angle = -12;
        }
    }

    private function hitTorsoArea(arrow:Arrow, pow:Float): Void {
        if (pow < powerToggle) {
            arrow.velocity.y = -10;
            arrow.velocity.x = 240;
            arrow.angle = -5;
        } else {
            arrow.velocity.y = -8;
            arrow.velocity.x = 330;
            arrow.angle = -5;
        }
    }

    private function hitLeftArmArea(arrow:Arrow, pow:Float): Void {
        if (pow < powerToggle) {
            arrow.velocity.y = -10;
            arrow.velocity.x = 240;
            arrow.angle = -5;
        } else {
            arrow.velocity.y = -8;
            arrow.velocity.x = 330;
            arrow.angle = -9;
        }
    }

    private function hitLeftLegArea(arrow:Arrow, pow:Float): Void {
        if (pow < powerToggle) {
            arrow.velocity.y = 2;
            arrow.velocity.x = 240;
            arrow.angle = -5;
        } else {
            arrow.velocity.y = 8;
            arrow.velocity.x = 330;
            arrow.angle = -9;
        }
    }

    private function hitRightLegArea(arrow:Arrow, pow:Float): Void {
        if (pow < powerToggle) {
            arrow.velocity.y = 1;
            arrow.velocity.x = 240;
            arrow.angle = -4;
        } else {
            arrow.velocity.y = 5;
            arrow.velocity.x = 330;
            arrow.angle = -8;
        }
    }

    private function getAdjustedReticlePos():FlxPoint {
        var pos:FlxPoint = new FlxPoint(reticle.x, reticle.y);
        var delta = Std.int(windIntensity / 5);
        if (windDirection == 0) {
            pos.y -= delta;
        } else if (windDirection == 1) {
            pos.x += delta;
        } else if (windDirection == 2) {
            pos.x -= delta;
        } else {
            pos.y += delta;
        }
        pos.x += Std.int(reticle.width / 2);
        pos.y += Std.int(reticle.height / 2);
        return pos;
    }

    private function getHitBodyPart(point:FlxPoint):String {
        if (point.x >= 93 && point.x <= 97 && point.y >= 66 && point.y <= 69) {
            return "rightarm";
        } else if (point.x >= 94 && point.x <= 99 && point.y >= 74 && point.y <= 81) {
            return "rightleg";
        } else if (point.x >= 97 && point.x <= 102 && point.y >= 68 && point.y <= 74) {
            return "torso";
        } else if (point.x >= 101 && point.x <= 106 && point.y >= 66 && point.y <= 69) {
            return "leftarm";
        } else if (point.x >= 99 && point.x <= 105 && point.y >= 74 && point.y <= 81) {
            return "leftleg";
        } else if (point.x >= 98 && point.x <= 101 && point.y >= 64 && point.y <= 68) {
            return "head";
        }
        return "";
    }

    public function makeSmallBlood(arrow:Arrow) {
        var blood = new SmallBlood(arrow.x + 2, arrow.y);
        smallBloods.push(blood);
        this.add(blood);
        hitText.setHit("");
        this.add(hitText);
        hitText.startAnim();
        victimLife -= arrow.willHit == "head" ? 5 : 3;
    }

    public function makeExplosion(arrow:Arrow) {
        var explosion = new Explosion(arrow.x - 3, arrow.y - 5);
        explosions.push(explosion);
        this.add(explosion);
        sideVictim.removePart(arrow.willHit);
        frontVictim.removePart(arrow.willHit);
        hitText.setHit(arrow.willHit);
        this.add(hitText);
        hitText.startAnim();
        if (arrow.powered) {
            this.remove(arrow);
        }
        victimLife -= arrow.willHit == "head" ? 10 : 6;
        if (arrow.willHit == "head") {
            bonusHead = true;
        } else if(arrow.willHit == "leftleg") {
            bonusLeftLeg = true;
        } else if (arrow.willHit == "leftarm") {
            bonusLeftArm = true;
        } else if (arrow.willHit == "rightleg") {
            bonusRightLeg = true;
        } else if (arrow.willHit == "rightarm") {
            bonusRightArm = true;
        }
    }

    public function notifyNextHit(): Void {
        if (victimLife > 0) {
            reticle.resetCmp();
            power.resetCmp();
            hitText.resetCmp();
            executer.startAiming();
        } else {
            executer.animation.play("happy");
            Timer.delay(showScore, 2000);
        }
    }

    private function getBonusPoints(): Int {
        if ((currentMission == 1 && bonusHead) ||
            (currentMission == 2 && (bonusLeftLeg || bonusRightLeg)) ||
            (currentMission == 3 && bonusRightArm) ||
            (currentMission == 4 && bonusLeftArm && bonusLeftLeg)) {
            return 100;
        }
        if (currentMission == 5 && totalTime < 360) {
            return 100;
        }
        return 0;
    }

    private function showScore():Void {
        var gained:Int = 0;
        gained += getBonusPoints();
        if (arrowsUsed == 1) {
            gained += 100;
        } else if(arrowsUsed == 2) {
            gained += 70;
        } else if (arrowsUsed == 3) {
            gained += 50;
        } else if (arrowsUsed == 4) {
            gained += 30;
        } else {
            gained += 10;
        }
        var spent:Int = Std.int(totalTime / 60);
        if (spent < 30) {
            gained += 100;
        } else if (spent < 35) {
            gained += 70;
        } else if (spent < 40) {
            gained += 50;
        } else if (spent < 45) {
            gained += 30;
        } else if (spent < 50) {
            gained += 10;
        }
        scoreBoard = new Tuto(53, 16, "scoreboard");
        this.add(scoreBoard);
        this.add(new FlxText(109, 24, 28, Std.string(arrowsUsed), 8));
        this.add(new FlxText(110, 34, 26, Std.string(Std.int(totalTime / 60)), 8));
        this.add(new FlxText(96, 44, 26, Std.string(getBonusPoints()), 8));
        this.add(new FlxText(106, 65, 26, Std.string(gained), 8));
        currentGold += gained;
        this.add(new FlxText(110, 75, 26, Std.string(currentGold), 8));
        x = new Tuto(176, 106, "x");
        this.add(x);
        this.currentStep = 1;
        timer = 0;

    }





}











