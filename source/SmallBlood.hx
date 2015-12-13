package;

import flixel.FlxSprite;

class SmallBlood extends FlxSprite
{

    public function new(x:Float, y:Float) {
        super(x, y);
        loadGraphic("assets/sprite/small-blood.png", true, 6, 6);
        animation.add("flow", [0,1,2,3,4,5], 10, false);
        animation.play("flow");
    }
}