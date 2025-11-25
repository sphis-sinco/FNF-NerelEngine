package neral;

import lime.app.Application;
import neral.AppSettings.AppSettingsClass;

class Constants
{
	public static var VERSIONS(get, never):Dynamic;

	static function get_VERSIONS():Dynamic
	{
		var versions = {
			funkin: Application.current.meta.get('version'),
			psych: "1.0.4",
			neral: "Alpha 0.1.0"
		}

		for (extra_version in (APP_SETTINGS?.settings?.extra_versions ?? []))
			if (!['funkin', 'psych', 'neral'].contains(extra_version.name))
				Reflect.setField(versions, extra_version.name, extra_version.version);

		return versions;
	}

	public static var APP_SETTINGS(get, never):AppSettingsClass;

	static var app_settings_background:AppSettingsClass;

	static function get_APP_SETTINGS():AppSettingsClass
	{
		if (app_settings_background == null)
			app_settings_background = new AppSettingsClass(Paths.json('app/settings'));

		return app_settings_background;
	}
}
