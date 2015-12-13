package;

import flixel.FlxSprite;
import flixel.util.FlxPoint;
import flixel.group.FlxSpriteGroup;

class WindText extends FlxSpriteGroup {

    private var mph:FlxSprite;
    private var nb1:FlxSprite;
    private var nb2:FlxSprite;

    public function new(x:Float, y:Float) {
        super();
        nb1 = new FlxSprite();
        nb1.loadGraphic("assets/sprite/font.png", true, 4, 5, true);
        nb1.animation.add("dumb", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9], 0, false);
        nb1.animation.play("dumb");
        this.add(nb1);
        nb2 = new FlxSprite();
        nb2.loadGraphic("assets/sprite/font.png", true, 4, 5, true);
        nb2.animation.add("dumb", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9], 0, false);
        nb2.animation.play("dumb");
        this.add(nb2);
        mph = new FlxSprite();
        mph.loadGraphic("assets/sprite/mph.png", false);
        this.add(mph);
    }

    public function setValue(value:Float) {
        var d:Int = Std.int(value / 10);
        var r:Int = Std.int(value) - d * 10;
        nb1.animation.frameIndex = Std.int(d);
        nb2.animation.frameIndex = Std.int(r);
        if (d == 0) {
            nb1.setPosition(-10, -10);
            nb2.setPosition(84, 98);
            mph.setPosition(88, 98);
        } else {
            nb1.setPosition(84, 98);
            nb2.setPosition(88, 98);
            mph.setPosition(93, 98);
        }

    }

}