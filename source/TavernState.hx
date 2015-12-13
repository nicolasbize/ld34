package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import haxe.Timer;

/**
 * A FlxState which can be used for the game's menu.
 */
class TavernState extends FlxState
{

    private var currentGold:Int = 0;
    private var currentMission:Int = 1;
    private var missionScreen:Tuto = null;

    public function new(gold:Int, mission:Int) {
        currentGold = gold;
        currentMission = mission;
        super();
    }

    override public function create():Void
    {
        FlxG.log.redirectTraces = true;
        this.add(new FlxSprite().loadGraphic("assets/sprite/black.png", false));
        this.loadMission(currentMission);
        super.create();
    }

    private function loadMission(missionNb:Int) {
        missionScreen = new Tuto(0, 0, "mission" + missionNb);
        this.add(missionScreen);
    }


}