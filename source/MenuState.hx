package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.FlxSound;
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
    private var introMusic:FlxSound = null;
    private var clickSound:FlxSound = null;
    private var button1Displayed:Bool = false;
    private var button2Displayed:Bool = false;

    /**
     * Function that is called up when to state is created to set it up.ftftffyhfhf
     */
    override public function create():Void
    {
        FlxG.log.redirectTraces = true;

        this.add(new FlxSprite().loadGraphic("assets/sprite/black.png", false));
        tavern = new Tavern(0, 0);
        tavern.menu = this;
        this.add(tavern);
        Timer.delay(showTitle, 1000);
        introMusic = FlxG.sound.load("assets/music/music-intro-end.ogg");
        introMusic.play();
        clickSound = FlxG.sound.load("assets/sound/click.ogg");
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
            button1Displayed = true;
        }
    }

    public function showButton2(): Void {
        if (currentStep == 0) {
            button2 = new MenuButton(200, 102, "story-mode");
            this.add(button2);
            button2Displayed = true;
        }
    }

    override public function update():Void {
        super.update();
        timer++;
        if (FlxG.keys.anyPressed(["X"])) {
            if (currentStep == 0 && timer > 40) {
                clickSound.play();
                tuto1 = new Tuto(0, 0, "tuto1");
                this.add(tuto1);
                timer = 0;
                currentStep = 1;
            } else if (currentStep == 1 && timer > 40) {
                clickSound.play();
                tuto2 = new Tuto(0, 0, "tuto2");
                this.add(tuto2);
                currentStep = 2;
                timer = 0;
            } else if (currentStep == 2 && timer > 40) {
                clickSound.play();
                tuto1.isFading = true;
                tuto2.isFading = true;
                currentStep = 0;
                timer = 0;
            } else if (currentStep == 3 && timer > 40) {
                clickSound.play();
                this.remove(tavern);
                this.remove(tuto1);
                this.remove(title);
                this.remove(tuto2);
                if (button1Displayed) {
                    button1.hidden = true;
                }
                if (button2Displayed) {
                    button2.hidden = true;
                }
                this.remove(button1);
                this.remove(button2);
                intro.isFading = true;
                currentStep = 5;
                if (introMusic.playing) {
                    introMusic.fadeOut(1);
                }
                Timer.delay(startGame, 1000);
            }
            // how to play

        } else if (FlxG.keys.anyPressed(["C"]) && currentStep == 0) {
            clickSound.play();
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