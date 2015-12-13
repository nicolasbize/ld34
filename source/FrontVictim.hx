package;

import flixel.FlxSprite;
import flixel.util.FlxPoint;
import flixel.group.FlxSpriteGroup;

class FrontVictim extends FlxSpriteGroup {

    private var leftLeg:FlxSprite;
    private var rightLeg:FlxSprite;
    private var torso:FlxSprite;
    private var rightArm:FlxSprite;
    private var leftArm:FlxSprite;
    private var head:FlxSprite;

    public function new(x:Float, y:Float) {
        super();

        torso = new FlxSprite();
        torso.loadGraphic("assets/sprite/front-torso.png", false);
        torso.setPosition(96, 66);
        this.add(torso);

        leftLeg = new FlxSprite();
        leftLeg.loadGraphic("assets/sprite/front-left-leg.png", false);
        leftLeg.setPosition(99, 74);
        this.add(leftLeg);
        rightLeg = new FlxSprite();
        rightLeg.loadGraphic("assets/sprite/front-right-leg.png", false);
        rightLeg.setPosition(94, 74);
        this.add(rightLeg);

        leftArm = new FlxSprite();
        leftArm.loadGraphic("assets/sprite/front-left-arm.png", false);
        leftArm.setPosition(101, 66);
        this.add(leftArm);
        rightArm = new FlxSprite();
        rightArm.loadGraphic("assets/sprite/front-right-arm.png", false);
        rightArm.setPosition(93, 66);
        this.add(rightArm);

        head = new FlxSprite();
        head.loadGraphic("assets/sprite/front-head.png", false);
        head.setPosition(98, 64);
        this.add(head);
    }


}