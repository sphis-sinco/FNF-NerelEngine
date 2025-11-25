package neral;

import neral.AppSettings.AppSettingsClass;

class Constants
{
    public static var APP_SETTINGS(get, never):AppSettingsClass;

    static var app_settings_background:AppSettingsClass;

    static function get_APP_SETTINGS():AppSettingsClass
    {
        if (app_settings_background == null)
            app_settings_background = new AppSettingsClass(Paths.json('app/settings'));

        return app_settings_background;
    }
}