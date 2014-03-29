package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	private var _player:Player;
	private var _paddleTop:FlxSprite;
	private var _paddleBottom:FlxSprite;
	private var _paddleLeft:FlxSprite;
	private var _paddleRight:FlxSprite;

	private var _paddleGroup:FlxGroup;

	private var _paddleSpeed:Int = 500;

	public var scoreText:FlxText;
	public var score:Int = 0;


	/**
	 * Function that is called up when to state is created to set it up.
	 */
	override public function create():Void
	{
		super.create();

		FlxG.mouse.visible = false;
		// trace() will show up in the console window
		FlxG.log.redirectTraces = false;

		FlxG.camera.bgColor = 0xffb8c4d9;

		_player = new Player(FlxG.width/2 - 8, FlxG.height/2 - 8);
		add(_player);

		_paddleGroup = new FlxGroup();

		_paddleTop = new FlxSprite(FlxG.width/2 - 50,0);
		_paddleTop.makeGraphic(100,20,0xff364950);
		_paddleTop.immovable = true;
		_paddleGroup.add(_paddleTop);

		_paddleBottom = new FlxSprite(FlxG.width/2 - 50,FlxG.height-20);
		_paddleBottom.makeGraphic(100,20,0xff364950);
		_paddleBottom.immovable = true;
		_paddleGroup.add(_paddleBottom);

		_paddleRight = new FlxSprite(FlxG.width - 20,FlxG.height/2 - 50);
		_paddleRight.makeGraphic(20,100,0xff364950);
		_paddleRight.immovable = true;
		_paddleGroup.add(_paddleRight);

		_paddleLeft = new FlxSprite(0,FlxG.height/2 - 50);
		_paddleLeft.makeGraphic(20,100,0xff364950);
		_paddleLeft.immovable = true;
		_paddleGroup.add(_paddleLeft);

		add(_paddleGroup);

		scoreText = new FlxText(FlxG.width/2 - 50,30,200,"Score: " + score,18);
		add(scoreText);

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
		_paddleTop.velocity.x = 0.0;
		_paddleBottom.velocity.x = 0.0;
		_paddleLeft.velocity.y = 0.0;
		_paddleRight.velocity.y = 0.0;

		if(FlxG.keys.anyPressed(["LEFT","A"]))
		{
			_paddleTop.velocity.x = -_paddleSpeed;
			_paddleBottom.velocity.x = -_paddleSpeed;
		}
		if(FlxG.keys.anyPressed(["RIGHT","D"]))
		{
			_paddleTop.velocity.x = _paddleSpeed;
			_paddleBottom.velocity.x = _paddleSpeed;
		}
		if(FlxG.keys.anyPressed(["UP","W"]))
		{
			_paddleLeft.velocity.y = -_paddleSpeed;
			_paddleRight.velocity.y = -_paddleSpeed;
		}
		if(FlxG.keys.anyPressed(["DOWN","S"]))
		{
			_paddleLeft.velocity.y = _paddleSpeed;
			_paddleRight.velocity.y = _paddleSpeed;
		}

		FlxG.collide(_paddleGroup,_player);

		super.update();

		_paddleTop.x = FlxMath.bound(_paddleTop.x,0,FlxG.width - 100);
		_paddleBottom.x = FlxMath.bound(_paddleBottom.x,0,FlxG.width - 100);
		_paddleLeft.y = FlxMath.bound(_paddleLeft.y,0,FlxG.height - 100);
		_paddleRight.y = FlxMath.bound(_paddleRight.y,0,FlxG.height - 100);
	}
}