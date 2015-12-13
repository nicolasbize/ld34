package;

import flixel.FlxSprite;
import flixel.util.FlxPoint;
import haxe.Timer;

class Title extends FlxSprite
{

    public function new(x:Float, y:Float) {
        super(x, y);
        loadGraphic("assets/sprite/title.png");
        resetCmp();
    }

    public function resetCmp():Void {
        alpha = 0;
        velocity.y = 10;
        acceleration.y = -5;
    }

    override public function update():Void {
        super.update();
        if (alpha < 1) {
            alpha += 0.05;
        }
        if (velocity.y < 1) {
            acceleration.y = 0;
            velocity.y = 0;
        }
    }

}