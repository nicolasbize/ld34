package;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxMath;
import flixel.util.FlxPoint;
import flixel.util.FlxRandom;
import flixel.FlxG;

class Reticle extends FlxSprite
{
    // reticle is 23x23, so center at 12,12
    public var aimPanel:AimPanel = null;
    private var xLowLimit:Int = 72;
    private var yLowLimit:Int = 40;
    private var xHighLimit:Int = 105;
    private var yHighLimit:Int = 73;
    private var middle:FlxPoint = new FlxPoint(86, 56);
    private var anchor:FlxPoint;
    private var angularForce:Float = 10;
    private var timer = 100;
    private var customAccel = new FlxPoint(0, 0);
    private var xPressed:Bool = false;
    public var isAiming:Bool = false;
    private var hasAimed:Bool = false;
    private var frozen:Bool = false;

    public function new(x:Float, y:Float) {
        super(x, y);
        resetCmp();
    }

    public function resetCmp():Void {
        setPosition(FlxRandom.intRanged(xLowLimit, xHighLimit), FlxRandom.intRanged(yLowLimit, yHighLimit));
        anchor = middle;
        timer = 100;
        customAccel = new FlxPoint(0, 0);
        xPressed = false;
        isAiming = false;
        hasAimed = false;
        frozen = false;
        loadGraphic("assets/sprite/reticle.png", false);
    }

    override public function update():Void {
        super.update();
        if (!frozen) {
            timer -= 1;
            if (timer == 0) {
                timer = 100;
                var xCustomAccel = isAiming ? FlxRandom.intRanged(-1, 1) : FlxRandom.intRanged(-5, 5);
                var yCustomAccel = isAiming ? FlxRandom.intRanged(-1, 1) : FlxRandom.intRanged(-5, 5);
                customAccel = new FlxPoint(xCustomAccel, yCustomAccel);
            }
            acceleration = new FlxPoint(- (x - anchor.x) / 2 + customAccel.x, - (y - anchor.y) / 2 + customAccel.y);
            var newX:Float = FlxMath.bound(x, xLowLimit, xHighLimit);
            var newY:Float = FlxMath.bound(y, yLowLimit, yHighLimit);
            this.setPosition(newX, newY);

            xPressed = FlxG.keys.anyPressed(["X"]);

            if (xPressed && !isAiming && !hasAimed) {
                isAiming = true;
                anchor = new FlxPoint(x, y);
                velocity = new FlxPoint(velocity.x / 6, velocity.y / 6);
                acceleration = new FlxPoint(acceleration.x / 6, acceleration.y / 6);
                loadGraphic("assets/sprite/reticle2.png", false);
                hasAimed = true;
            } else if (isAiming && !xPressed) {
                isAiming = false;
                anchor = middle;
                loadGraphic("assets/sprite/reticle.png", false);
                velocity = new FlxPoint(FlxRandom.intRanged(-10, 10), FlxRandom.intRanged(-10, 10));
                acceleration = new FlxPoint(acceleration.x * 6, acceleration.y * 6);
            }
        }
    }

    public function freeze():Void {
        this.frozen = true;
        this.velocity = new FlxPoint(0, 0);
        this.acceleration = new FlxPoint(0, 0);
    }

}







