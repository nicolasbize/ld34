package;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxMath;
import flixel.util.FlxPoint;
import flixel.util.FlxRandom;
import flixel.tweens.FlxTween;
import flixel.FlxG;

class PowerGauge extends FlxSprite
{

    public var timer:Int = 10;
    private var scaleX:Float = 0;
    private var started:Bool = false;
    private var stopped:Bool = false;
    public var arena:ArenaState = null;
    private var dir = 1;

    public function new(x:Float, y:Float) {
        super(x, y);
        loadGraphic("assets/sprite/power.png", false);
        resetCmp();
    }

    public function resetCmp(): Void {
        setPosition(85, 105);
        origin = new FlxPoint(0, 0);
        scale = new FlxPoint(scaleX, 1);
        timer = 10;
        scaleX = 0.97;
        origin = new FlxPoint(0, 0);
        scale = new FlxPoint(scaleX, 1);
        started = false;
        stopped = false;
        dir = 1;
    }

    override public function update():Void {
        super.update();
        if (started && !stopped) {
            scaleX += dir * 0.03;
            if (scaleX > 1 && dir == 1) {
                dir = -1;
            }
            if (scaleX < 0) {
                stop();
            }
            scale = new FlxPoint(scaleX, 1);
        }
    }

    public function start():Void {
        if (!started) {
            started = true;
        }
    }

    public function stop():Void {
        if (started) {
            started = false;
            stopped = true;
            arena.completeShot();
        }
    }

    public function getValue():Int {
        return Std.int(scaleX * 100);
    }

}