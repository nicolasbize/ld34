package;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxG;

class AimPanel extends FlxSprite
{

    public var arena:ArenaState = null;
    private var isShooting:Bool = false;
    private var hasShot:Bool = false;
    private var cPressed:Bool = false;

    public function new(x:Float, y:Float) {
        super(x, y);
        loadGraphic("assets/sprite/aimer.png", false);
    }

    override public function update():Void {
        super.update();
        cPressed = FlxG.keys.anyPressed(["C"]);
        if (cPressed && !isShooting) {
            arena.startShooting();
            isShooting = true;
        } else if (!cPressed && isShooting) {
            arena.stopShooting();
            isShooting = false;
        }
    }


}