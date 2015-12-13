package;

import flixel.FlxSprite;
import flixel.FlxState;
import haxe.Timer;

enum State {
    Idle;
    Walking;
    Shooting;
}

class Executer extends FlxSprite
{

    private var state:State = State.Idle;
    public var arena:ArenaState = null;

    public function new(x:Float=-20, y:Float=-20) {
        super(x, y);
        loadGraphic("assets/sprite/executer.png", true, 19, 19);
        animation.add("walk", [0,1,2,0], 6, true);
        animation.add("aim", [0, 3, 4, 5, 6], 6, false);
        animation.add("shoot", [7, 0], 12, false);
        animation.add("idle", [0], 6, false);

        // animation.play("walk");
        // velocity.x = 20;
    }

    override public function update():Void {
        super.update();
        if (this.state == State.Walking && x > 20) {
            this.velocity.x = 0;
            this.state = State.Idle;
            animation.play("idle");
            Timer.delay(startAiming, 1000);
        }
    }

    private function startWalkingToShootingArea():Void {
        animation.play("walk");
        velocity.x = 20;
        this.state = State.Walking;
    }

    public function getInPosition():Void {
        this.setPosition(-20, 73);
        this.startWalkingToShootingArea();
    }

    private function getAimCross():Void {
        arena.aim();
    }

    private function startAiming():Void {
        animation.play("aim");
        Timer.delay(getAimCross, 1000);
    }
}