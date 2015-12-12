package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

/**
 * A FlxState which can be used for the game's arena.
 */
class ArenaState extends FlxState
{

    override public function create():Void
    {
        FlxG.log.redirectTraces = true;
        // FlxG.debugger.visible = true;

        this.add(new FlxSprite().loadGraphic("assets/sprite/background/arena.png", false));
        super.create();
    }

}