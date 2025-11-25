package neral;

import haxe.Json;

class AppSettingsClass
{
	public var settings:AppSettings;

	public function new(file_path:String = 'assets/data/app/settings.json')
	{
		try
		{
			settings = Json.parse(Paths.getTextFromFile(file_path));
		}
		catch (e)
		{
			trace(e);
            settings = {
                save_name: 'neral'
            };
		}
	}
}

typedef AppSettings =
{
	var save_name:String;
}
