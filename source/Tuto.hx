package;

import flixel.FlxSprite;
import flixel.util.FlxPoint;
import haxe.Timer;

class Tuto extends FlxSprite
{

    public var isFading:Bool = false;

    public function new(x:Float, y:Float, name:String) {
        super(x, y);
        loadGraphic("assets/sprite/" + name + ".png");
        alpha = 0;
    }

    override public function update():Void {
        super.update();
        if (!isFading) {
            if (alpha < 1) {
                alpha += 0.05;
            }
        } else {
            if (alpha > 0) {
                alpha -= 0.05;
            }
        }
    }

}