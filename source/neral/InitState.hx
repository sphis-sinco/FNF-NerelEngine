package neral;

#if HSCRIPT_ALLOWED
import crowplexus.iris.Iris;
import psychlua.HScript.HScriptInfos;
#end
import backend.Highscore;
import states.TitleState;
import openfl.Lib;

class InitState extends MusicBeatState
{
	override public function new()
	{
		super();
	}

	override function create()
	{
		super.create();

		#if HSCRIPT_ALLOWED
		Iris.warn = function(x, ?pos:haxe.PosInfos)
		{
			Iris.logLevel(WARN, x, pos);
			var newPos:HScriptInfos = cast pos;
			if (newPos.showLine == null)
				newPos.showLine = true;
			var msgInfo:String = (newPos.funcName != null ? '(${newPos.funcName}) - ' : '') + '${newPos.fileName}:';
			#if LUA_ALLOWED
			if (newPos.isLua == true)
			{
				msgInfo += 'HScript:';
				newPos.showLine = false;
			}
			#end
			if (newPos.showLine == true)
			{
				msgInfo += '${newPos.lineNumber}:';
			}
			msgInfo += ' $x';
			if (PlayState.instance != null)
				PlayState.instance.addTextToDebug('WARNING: $msgInfo', FlxColor.YELLOW);
		}
		Iris.error = function(x, ?pos:haxe.PosInfos)
		{
			Iris.logLevel(ERROR, x, pos);
			var newPos:HScriptInfos = cast pos;
			if (newPos.showLine == null)
				newPos.showLine = true;
			var msgInfo:String = (newPos.funcName != null ? '(${newPos.funcName}) - ' : '') + '${newPos.fileName}:';
			#if LUA_ALLOWED
			if (newPos.isLua == true)
			{
				msgInfo += 'HScript:';
				newPos.showLine = false;
			}
			#end
			if (newPos.showLine == true)
			{
				msgInfo += '${newPos.lineNumber}:';
			}
			msgInfo += ' $x';
			if (PlayState.instance != null)
				PlayState.instance.addTextToDebug('ERROR: $msgInfo', FlxColor.RED);
		}
		Iris.fatal = function(x, ?pos:haxe.PosInfos)
		{
			Iris.logLevel(FATAL, x, pos);
			var newPos:HScriptInfos = cast pos;
			if (newPos.showLine == null)
				newPos.showLine = true;
			var msgInfo:String = (newPos.funcName != null ? '(${newPos.funcName}) - ' : '') + '${newPos.fileName}:';
			#if LUA_ALLOWED
			if (newPos.isLua == true)
			{
				msgInfo += 'HScript:';
				newPos.showLine = false;
			}
			#end
			if (newPos.showLine == true)
			{
				msgInfo += '${newPos.lineNumber}:';
			}
			msgInfo += ' $x';
			if (PlayState.instance != null)
				PlayState.instance.addTextToDebug('FATAL: $msgInfo', 0xFFBB0000);
		}
		#end

		#if LUA_ALLOWED
		Mods.pushGlobalMods();
		#end
		Mods.loadTopMod();

		FlxG.save.bind('funkin', CoolUtil.getSavePath());
		Highscore.load();

		#if LUA_ALLOWED Lua.set_callbacks_function(cpp.Callable.fromStaticFunction(psychlua.CallbackHandler.call)); #end
		Controls.instance = new Controls();
		ClientPrefs.loadDefaultKeys();
		#if ACHIEVEMENTS_ALLOWED Achievements.load(); #end

		#if (linux || mac) // fix the app icon not showing up on the Linux Panel / Mac Dock
		var icon = lime.graphics.Image.fromFile("icon.png");
		Lib.current.stage.window.setIcon(icon);
		#end

		#if html5
		FlxG.autoPause = false;
		FlxG.mouse.visible = false;
		#end

		FlxG.fixedTimestep = false;
		FlxG.game.focusLostFramerate = 60;
		FlxG.keys.preventDefaultKeys = [TAB];

		#if CRASH_HANDLER
		Lib.current.loaderInfo.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR, onCrash);
		#end

		#if DISCORD_ALLOWED
		DiscordClient.prepare();
		#end

		FlxG.switchState(() -> new TitleState());
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
