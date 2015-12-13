package;

import flixel.FlxSprite;
import flixel.FlxState;
import haxe.Timer;

class Wind extends FlxSprite
{

    public var arena:ArenaState = null;

    public function new(x:Float, y:Float) {
        super(x, y);
        loadGraphic("assets/sprite/wind.png", true, 7, 7);
        animation.add("up", [0], 1, false);
        animation.add("right", [1], 1, false);
        animation.add("left", [2], 1, false);
        animation.add("down", [3], 1, false);
        animation.play("up");
    }

    public function setDir(dir:Int = 0) {
        if (dir == 1) {
            animation.play("right");
        } else if (dir == 2) {
            animation.play("left");
        } else if (dir == 3) {
            animation.play("down");
        } else {
            animation.play("up");
        }
    }
}