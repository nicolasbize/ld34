package;

import flixel.FlxSprite;
import flixel.FlxState;
import haxe.Timer;
import flixel.FlxG;

class Arrow extends FlxSprite
{

    public var arena:ArenaState = null;
    private var isShooting:Bool = false;
    private var hasShot:Bool = false;
    private var moving:Bool = true;
    public var willHit:String = "";
    public var powered:Bool = false;

    public function new(x:Float, y:Float) {
        super(x, y);
        angle = -12;
        loadGraphic("assets/sprite/arrow.png", false);
        acceleration.y = 30;
        acceleration.x = -2;
    }

    public function setPowered():Void {
        loadGraphic("assets/sprite/arrow2.png", false);
        powered = true;
    }

    override public function update():Void {
        super.update();
        if (moving) {
            angle += 0.3;
            if (y > 90 || x > 300) {
                miss();
            }
            if (willHit != "") {
                if (willHit == "rightarm" && x > 162 && x <= 167 && y >= 74 && y <= 78) {
                    stop();
                } else if (willHit == "head" && x >= 165 && x <= 173 && y >= 72 && y <= 78) {
                    stop();
                } else if (willHit == "torso" && x >= 163 && x <= 172 && y >= 76 && y <= 83) {
                    stop();
                } else if (willHit == "leftarm" && x > 169 && x <= 175 && y >= 77 && y <= 81) {
                    stop();
                } else if (willHit == "rightleg" && x > 161 && x <= 171 && y >= 83 && y <= 90) {
                    stop();
                } else if (willHit == "leftleg" && x > 166 && x <= 171 && y >= 84 && y <= 90) {
                    stop();
                }
            }
        }
    }

    private function miss():Void {
        stop();
        Timer.delay(arena.notifyNextHit, 1000);

    }

    private function stop():Void {
        acceleration.y = 0;
        acceleration.x = 0;
        velocity.x = 0;
        velocity.y = 0;
        moving = false;
        if (willHit != "") {
            if (powered && willHit != "torso") {
                arena.makeExplosion(this);
            } else {
                arena.makeSmallBlood(this);
            }
        }
    }



}