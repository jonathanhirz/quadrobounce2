package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.text.FlxText;

class Player extends FlxSprite
{
	private var _xSpeed:Int = 200;
	private var _ySpeed:Int = 200;

	//score
	public var scoreState:PlayState = cast FlxG.state;

	public function new (X:Float, Y:Float)
	{
		super(X, Y);
		makeGraphic(16,16,0xffa34119);
	}

	override public function update():Void
	{
		velocity.x = _xSpeed;
		velocity.y = _ySpeed;

		if(justTouched(flixel.FlxObject.FLOOR))
		{
			_ySpeed = -_ySpeed;
			scoreState.score += 1;
			scoreState.scoreText.text = "Score: " + scoreState.score;
		}
		if(justTouched(flixel.FlxObject.CEILING))
		{
			_ySpeed = -_ySpeed;
			scoreState.score += 1;
			scoreState.scoreText.text = "Score: " + scoreState.score;
		}
		if(justTouched(flixel.FlxObject.LEFT))
		{
			_xSpeed = -_xSpeed;
			scoreState.score += 1;
			scoreState.scoreText.text = "Score: " + scoreState.score;
		}
		if(justTouched(flixel.FlxObject.RIGHT))
		{
			_xSpeed = -_xSpeed;
			scoreState.score += 1;
			scoreState.scoreText.text = "Score: " + scoreState.score;
		}

		if(x < 0 || x > FlxG.width - 16 || y < 0 || y > FlxG.height - 16)
		{
			//trace("GAMEOVER");
			FlxG.switchState(new GameOverState());
		}

		super.update();

	}

}