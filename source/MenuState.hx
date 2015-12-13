package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{

    /**
     * Function that is called up when to state is created to set it up.ftftffyhfhf
     */
    override public function create():Void
    {
        FlxG.log.redirectTraces = true;
        // FlxG.debugger.visible = true;

        this.add(new FlxSprite().loadGraphic("assets/sprite/background/mainmenu.png", false));
        super.create();
    }

}