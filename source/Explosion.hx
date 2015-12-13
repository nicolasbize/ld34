package;

import flixel.FlxSprite;

class Explosion extends FlxSprite
{

    public function new(x:Float, y:Float) {
        super(x, y);
        loadGraphic("assets/sprite/explosion.png", true, 10, 10);
        animation.add("flow", [0,1,2,3,4,5,6,7,8], 15, false);
        animation.play("flow");
    }
}