package;

import flixel.FlxSprite;
import flixel.util.FlxPoint;
import haxe.Timer;

class Tavern extends FlxSprite
{

    public var menu:MenuState = null;

    public function new(x:Float, y:Float) {
        super(x, y);
        loadGraphic("assets/sprite/tavern.png");
        resetCmp();
    }

    public function resetCmp():Void {
        alpha = 0;
    }

    override public function update():Void {
        super.update();
        if (alpha < 1) {
            alpha += 0.03;
        }
    }

    // private function showMenuTitle():Void {
    //     Timer.delay(stopAim, 1000);
    // }

    // private function requireMenuTitle(): Void {
    //     menu.showTitle();
    // }

}