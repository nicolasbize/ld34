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
    private var tavern:Tuto = null;
    private var king:Tuto = null;
    private var kingDialog:Tuto = null;
    private var timer:Int = 0;
    private var currentStep:Int = 0;
    private var x:Tuto = null;
    private var blackScreen:Tuto = null;

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

    private function showTavern() : Void {
        timer = 0;
        currentStep = 1;
        tavern = new Tuto(0, 0, "tavern");
        this.add(tavern);
        Timer.delay(showKing, 3000);
    }

    private function showKing():Void {
        king = new Tuto(128, 25, "king");
        this.add(king);
        Timer.delay(showKingDialog, 1000);
    }

    private function showKingDialog(): Void {
        kingDialog = new Tuto(2, 1, "mission" + currentMission + "text");
        this.add(kingDialog);
        x = new Tuto(176, 106, "x");
        this.add(x);
        currentStep = 2;
        timer = 0;
    }

    override public function update():Void {
        super.update();
        timer++;
        if (FlxG.keys.anyPressed(["X"])) {
            if (currentStep == 0 && timer > 40) {
                showTavern();
            } else if (currentStep == 2 && timer > 40) {
                prepareArena();
            }
        }
    }

    private function prepareArena() {
        blackScreen = new Tuto(0, 0, "black");
        this.add(blackScreen);
        Timer.delay(loadArena, 1000);
    }

    private function loadArena() {
        FlxG.switchState(new ArenaState(currentGold, currentMission));
    }


}


