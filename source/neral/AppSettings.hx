package neral;

import haxe.Json;

class AppSettingsClass
{
	public var settings:AppSettings;

	var default_settings:AppSettings = {
		"save_name": "neral",
		"crash_handler": {
			"file_prefix": "Neral",
			"platform": "Github",
			"url": "https://github.com/sphis-sinco/FNF-NerelEngine"
		}
	};

	public function get(field:String):Dynamic
	{
		try
		{
			var return_value:Dynamic = null;

			if (field.contains('.'))
			{
				var split_fields:Array<String> = field.split('.');
				var the_json:Dynamic = settings;

				for (split in split_fields)
					the_json = Reflect.field(the_json, split);

				return_value = the_json;
			}
			else
			{
				return_value = Reflect.field(settings, field);
			}

			if (return_value != null)
				return return_value;
		}
		catch (_)
		{
		}

		return '{' + field + '}';
	}

	public function new(file_path:String = 'assets/data/app/settings.json')
	{
		try
		{
			settings = Json.parse(Paths.getTextFromFile(file_path));
		}
		catch (e)
		{
			trace(e);
			settings = default_settings;
		}
	}
}

typedef AppSettings =
{
	var save_name:String;
	var crash_handler:
		{
			var file_prefix:String;
			var platform:String;
			var url:String;
		};
}
