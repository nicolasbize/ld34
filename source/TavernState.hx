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

    public function new(gold:Int, mission:Int) {
        currentGold = gold;
        currentMission = mission;
        super();
    }


}