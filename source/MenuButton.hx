package;

import flixel.FlxSprite;
import flixel.util.FlxPoint;
import haxe.Timer;

class MenuButton extends FlxSprite
{

    public var hidden:Bool = false;

    public function new(x:Float, y:Float, name:String) {
        super(x, y);
        loadGraphic("assets/sprite/" + name + ".png");
        resetCmp();
    }

    public function resetCmp():Void {
        alpha = 0;
        velocity.x = -100;
        acceleration.x = 20;
    }

    override public function update():Void {
        super.update();
        if (!hidden) {
            if (alpha < 1) {
                alpha += 0.05;
            }
            if (velocity.x > 0 || x < 110) {
                acceleration.x = 0;
                velocity.x = 0;
            }

        }
    }

}