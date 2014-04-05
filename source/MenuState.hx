package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	/**
	 * Function that is called up when to state is created to set it up.
	 */
	override public function create():Void
	{
		super.create();

		FlxG.camera.bgColor = 0xff337dd9;

		add(new FlxText(30,FlxG.height/2 - 140,640,"quadrobounce2",60));
		add(new FlxText(40,FlxG.height/2,640,"SPACE to start dude",20));
		add(new FlxText(40,FlxG.height/2+30,640,"ARROWS or WASD to move",20));
		add(new FlxText(40,FlxG.height/2+60,640,"Keep the ball on the screen",20));
	}

	/**
	 * Function that is called when this state is destroyed - you might want to
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		if(FlxG.keys.anyPressed(["SPACE"]))
		{
			FlxG.switchState(new PlayState());
		}
		super.update();
	}
}