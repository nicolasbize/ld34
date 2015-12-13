package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import haxe.Timer;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{

    private var tavern:Tavern = null;
    private var title:Title = null;
    private var currentStep:Int = 0;
    private var timer:Int = 0;
    private var tuto1:Tuto = null;
    private var tuto2:Tuto = null;
    private var intro:Tuto = null;
    private var button1:MenuButton = null;
    private var button2:MenuButton = null;

    /**
     * Function that is called up when to state is created to set it up.ftftffyhfhf
     */
    override public function create():Void
    {
        FlxG.log.redirectTraces = true;

        // FlxG.switchState(new ArenaState(0, 5));

        this.add(new FlxSprite().loadGraphic("assets/sprite/black.png", false));
        tavern = new Tavern(0, 0);
        tavern.menu = this;
        this.add(tavern);
        Timer.delay(showTitle, 1000);
        super.create();
    }

    public function showTitle(): Void {
        title = new Title(90, 0);
        this.add(title);
        Timer.delay(showButton1, 1000);
    }

    public function showButton1(): Void {
        if (currentStep == 0) {
            button1 = new MenuButton(200, 80, "how-to-play");
            this.add(button1);
            Timer.delay(showButton2, 500);
        }
    }

    public function showButton2(): Void {
        if (currentStep == 0) {
            button2 = new MenuButton(200, 102, "story-mode");
            this.add(button2);
        }
    }

    override public function update():Void {
        super.update();
        timer++;
        if (FlxG.keys.anyPressed(["X"])) {
            if (currentStep == 0 && timer > 40) {
                tuto1 = new Tuto(0, 0, "tuto1");
                this.add(tuto1);
                timer = 0;
                currentStep = 1;
            } else if (currentStep == 1 && timer > 40) {
                tuto2 = new Tuto(0, 0, "tuto2");
                this.add(tuto2);
                currentStep = 2;
                timer = 0;
            } else if (currentStep == 2 && timer > 40) {
                tuto1.isFading = true;
                tuto2.isFading = true;
                currentStep = 0;
                timer = 0;
            } else if (currentStep == 3 && timer > 40) {
                this.remove(tavern);
                this.remove(tuto1);
                this.remove(title);
                this.remove(tuto2);
                button1.hidden = true;
                button2.hidden = true;
                this.remove(button1);
                this.remove(button2);
                intro.isFading = true;
                currentStep = 5;
                Timer.delay(startGame, 1000);
            }
            // how to play

        } else if (FlxG.keys.anyPressed(["C"]) && currentStep == 0) {
            // story mode
            intro = new Tuto(0, 0, "intro");
            this.add(intro);
            timer = 0;
            currentStep = 3;
        }
    }

    public function startGame():Void {
        FlxG.switchState(new TavernState(0, 1));
    }



}