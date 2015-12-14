package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.FlxSound;
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
    private var widowCame:Bool = false;
    private var widow:Tuto = null;
    private var widowDialog:Tuto = null;
    private var music:FlxSound = null;
    private var clickSound:FlxSound = null;
    private var tavernSound:FlxSound = null;
    private var kingSound:FlxSound = null;


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
        music = FlxG.sound.load("assets/music/music.ogg");
        clickSound = FlxG.sound.load("assets/sound/click.ogg");
        tavernSound = FlxG.sound.load("assets/sound/tavern.ogg");
        kingSound = FlxG.sound.load("assets/sound/king.ogg");
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
        music.play();
        tavernSound.play();
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
        kingSound.play();
        x = new Tuto(176, 106, "x");
        this.add(x);
        currentStep = 2;
        timer = 0;
    }

    private function showWidowDialog(): Void {
        widowDialog = new Tuto(2, 1, "text-spare");
        this.add(widowDialog);
        x = new Tuto(176, 106, "x");
        this.add(x);
        currentStep = 2;
        timer = 0;
        widowCame = true;
    }

    override public function update():Void {
        if (!tavernSound.playing && currentStep != 0) {
            tavernSound.play();
        }
        super.update();
        timer++;
        if (FlxG.keys.anyPressed(["X"])) {
            if (currentStep == 0 && timer > 40) {
                clickSound.play();
                showTavern();
            } else if (currentStep == 2 && timer > 40) {
                if (currentMission == 5) {
                    if (!widowCame && timer > 120) {
                        clickSound.play();
                        kingDialog.isFading = true;
                        king.isFading = true;
                        x.isFading = true;
                        Timer.delay(showLady, 1000);
                    } else if (widowCame) {
                        clickSound.play();
                        prepareArena();
                    }
                } else if (timer > 40){
                    clickSound.play();
                    timer = 0;
                    prepareArena();
                }
            }
        }
    }

    private function showLady():Void {
        widow = new Tuto(133, 28, "lady");
        this.add(widow);
        timer = 0;
        Timer.delay(showWidowDialog, 1000);
    }

    private function prepareArena() {
        blackScreen = new Tuto(0, 0, "black");
        this.add(blackScreen);
        Timer.delay(loadArena, 1000);
        if (music.playing) {
            music.fadeOut(1);
        }
    }

    private function loadArena() {
        FlxG.switchState(new ArenaState(currentGold, currentMission));
    }


}


