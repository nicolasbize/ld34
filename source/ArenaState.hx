package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxPoint;
import flixel.util.FlxRandom;
import haxe.Timer;

/**
 * A FlxState which can be used for the game's arena.
 */
class ArenaState extends FlxState
{

    public var executer:Executer = null;
    public var aimPanel:AimPanel = null;
    public var windDirection:Int = 0;
    public var wind:Wind = null;
    public var windIntensity = 0;
    public var windText:WindText = null;
    public var reticle:Reticle = null;
    public var power:PowerGauge = null;
    public var arrows:Array<Arrow> = new Array<Arrow>();
    public var frontVictim:FrontVictim = null;
    public var sideVictim:SideVictim = null;

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
        sideVictim = new SideVictim(0, 0);
        power.arena = this;
        executer.arena = this;
        frontVictim = new FrontVictim(0, 0);
        this.add(sideVictim);
        // this.add(executer);
        // executer.getInPosition();
        // aim();
        super.create();
    }

    public function aim():Void {
        windDirection = FlxRandom.intRanged(0, 3);
        windIntensity = FlxRandom.intRanged(3, 20);
        this.add(aimPanel);
        wind.setDir(windDirection);
        this.add(wind);
        windText.setValue(windIntensity);
        this.add(windText);
        this.add(frontVictim);
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
        var arrow = new Arrow(29, 81);
        arrow.velocity.x = 40 + power.getValue() * 2.5;
        var adjustedReticle = getAdjustedReticlePos();
        if (power.getValue() > 70) {
            arrow.willHit = getHitBodyPart(adjustedReticle);
        }
        arrows.push(arrow);
        this.add(arrow);
        executer.animation.play("shoot");
    }

    private function getAdjustedReticlePos():FlxPoint {
        var pos:FlxPoint = new FlxPoint(reticle.x, reticle.y);
        var delta = Std.int(windIntensity / 3);
        if (windDirection == 0) {
            pos.y -= delta;
        } else if (windDirection == 1) {
            pos.x += delta;
        } else if (windDirection == 2) {
            pos.x -= delta;
        } else {
            pos.y += delta;
        }
        return pos;
    }

    private function getHitBodyPart(point:FlxPoint):String {
        if (point.x >= 93 && point.x <= 97 && point.y >= 66 && point.y <= 68) {
            return "rightarm";
        } else if (point.x >= 94 && point.x <= 98 && point.y >= 74 && point.y <= 80) {
            return "rightleg";
        } else if (point.x >= 97 && point.x <= 101 && point.y >= 68 && point.y <= 73) {
            return "torso";
        } else if (point.x >= 101 && point.x <= 105 && point.y >= 66 && point.y <= 68) {
            return "leftarm";
        } else if (point.x >= 99 && point.x <= 104 && point.y >= 74 && point.y <= 80) {
            return "leftleg";
        } else if (point.x >= 98 && point.x <= 100 && point.y >= 64 && point.y <= 67) {
            return "head";
        }
        return "";
    }








}











