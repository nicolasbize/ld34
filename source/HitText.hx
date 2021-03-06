package;

import flixel.FlxSprite;
import flixel.util.FlxPoint;

class HitText extends FlxSprite
{

    private var started:Bool = false;
    private var stopping:Bool = false;
    private var timer:Int = 0;
    public var arena:ArenaState = null;

    public function new(x:Float, y:Float) {
        super(x, y);
        resetCmp();
    }

    public function resetCmp():Void {
        alpha = 0;
        started = false;
        stopping = false;
        timer = 0;
        scale = new FlxPoint(1, 1);
        velocity = new FlxPoint(0, 0);
        acceleration = new FlxPoint(0, 0);
    }

    public function setHit(superHit:String) {
        this.y = 48;
        if (superHit == "head") {
            loadGraphic("assets/sprite/text-butcher.png", false);
            this.x = 111;
        } else if (superHit == "leftleg" || superHit == "rightleg") {
            this.x = 111;
            loadGraphic("assets/sprite/text-smashed.png", false);
        } else if (superHit == "leftarm" || superHit == "rightarm") {
            this.x = 100;
            loadGraphic("assets/sprite/text-porridge.png", false);
        } else if (superHit == "king") {
            this.x = 90;
            this.y = 37;
            loadGraphic("assets/sprite/text-aaah.png", false);
        } else {
            loadGraphic("assets/sprite/text-nice-hit.png", false);
            this.x = 128;
        }
    }

    override public function update():Void {
        super.update();
        if (started) {
            timer += 1;
            if (timer < 40) {
                scale = new FlxPoint(scale.x + 0.01, scale.y + 0.01);
                alpha += 0.05;
                if (alpha > 1) {
                    alpha = 1;
                }
            } else {
                stopAnim();
            }
        }
        if (stopping) {
            alpha -= 0.05;
            if (alpha == 0) {
                arena.notifyNextHit();
                stopping = false;
            }
        }
    }

    public function startAnim():Void {
        started = true;
        velocity.y = 5;
        acceleration.y = -2;
    }

    public function stopAnim():Void {
        started = false;
        stopping = true;
    }
}