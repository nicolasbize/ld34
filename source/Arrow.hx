package;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxG;

class Arrow extends FlxSprite
{

    public var arena:ArenaState = null;
    private var isShooting:Bool = false;
    private var hasShot:Bool = false;
    private var xPressed:Bool = false;
    private var moving:Bool = true;
    public var willHit:String = "";

    public function new(x:Float, y:Float) {
        super(x, y);
        loadGraphic("assets/sprite/arrow.png", false);
        acceleration.y = 30;
        acceleration.x = -2;
    }

    override public function update():Void {
        super.update();
        if (moving) {
            angle += 0.3;
        }
        if (y > 90) {
            stop();
        }
        if (willHit != "") {
            if (willHit == "rightarm") {

            }
        }
    }

    private function stop():Void {
        acceleration.y = 0;
        velocity.x = 0;
        velocity.y = 0;
        moving = false;
    }


}