package neral;

import states.TitleState;

class InitState extends MusicBeatState
{
	override public function new()
	{
		super();
	}

	override function create()
	{
		super.create();

		FlxG.switchState(() -> new TitleState());
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
