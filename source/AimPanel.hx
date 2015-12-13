package;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxG;

class AimPanel extends FlxSprite
{

    public var arena:ArenaState = null;
    private var isShooting:Bool = false;
    private var hasShot:Bool = false;
    private var xPressed:Bool = false;

    public function new(x:Float, y:Float) {
        super(x, y);
        loadGraphic("assets/sprite/aimer.png", false);
    }

    override public function update():Void {
        super.update();
        xPressed = FlxG.keys.anyPressed(["X"]);
        if (xPressed && !isShooting) {
            arena.startShooting();
            isShooting = true;
        } else if (!xPressed && isShooting) {
            arena.stopShooting();
            isShooting = false;
        }
    }


}