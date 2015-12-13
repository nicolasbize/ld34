package;

import flixel.FlxSprite;
import flixel.util.FlxPoint;
import flixel.group.FlxSpriteGroup;

class SideVictim extends FlxSpriteGroup {

    private var leftLeg:FlxSprite;
    private var rightLeg:FlxSprite;
    private var torso:FlxSprite;
    private var rightArm:FlxSprite;
    private var leftArm:FlxSprite;
    private var head:FlxSprite;

    public function new(x:Float, y:Float) {
        super();

        torso = new FlxSprite();
        torso.loadGraphic("assets/sprite/side-torso.png", false);
        torso.setPosition(166, 75);
        this.add(torso);

        leftLeg = new FlxSprite();
        leftLeg.loadGraphic("assets/sprite/side-left-leg.png", false);
        leftLeg.setPosition(169, 84);
        this.add(leftLeg);
        rightLeg = new FlxSprite();
        rightLeg.loadGraphic("assets/sprite/side-right-leg.png", false);
        rightLeg.setPosition(165, 84);
        this.add(rightLeg);

        leftArm = new FlxSprite();
        leftArm.loadGraphic("assets/sprite/side-left-arm.png", false);
        leftArm.setPosition(172, 76);
        this.add(leftArm);

        rightArm = new FlxSprite();
        rightArm.loadGraphic("assets/sprite/side-right-arm.png", false);
        rightArm.setPosition(164, 74);
        this.add(rightArm);

        head = new FlxSprite();
        head.loadGraphic("assets/sprite/side-head.png", false);
        head.setPosition(168, 71);
        this.add(head);
    }

    public function removePart(part:String) {
        if (part == "torso") {
            this.remove(torso);
        } else if (part == "leftleg") {
            this.remove(leftLeg);
        } else if (part == "rightleg") {
            this.remove(rightLeg);
        } else if (part == "torso") {
            this.remove(torso);
        } else if (part == "rightarm") {
            this.remove(rightArm);
        } else if (part == "leftarm") {
            this.remove(leftArm);
        }else if (part == "head") {
            this.remove(head);
        }
    }


}