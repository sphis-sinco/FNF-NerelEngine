# Neral Alpha 0.1.0

## Additions

- Added AppSettings : A JSON file containing information on the application
    - (Default) location: `assets/data/shared/app/settings.json`
    - Fields:
        - `save_name` - Controls the name of your save file.
        - `crash_handler` - Holds all the fields related to the crash handler
            - `file_prefix` - Prefix of the crash log file
            - `platform` - The platform you're using for the url
            - `url` - The url players see where they'll report the crash
        - (Optional) `extra_versions` - An array of versions for things
            - Can be used to add your mods version to the main menu version list
            - Fields of the versions:
                - `name` - The name of your mod, or whatever it is.
                - `version` - Version of your mod or whatever.
- Added "Constants" class : QOL class for holding information that will (most likely) be used all over
    - `VERSIONS` - A JSON with versions
        - `funkin` - FNF version
        - `psych` - Psych Engine version
        - `neral` - Neral Engine version
        - Other versions can be added via the app settings `extra_versions` field
            - The previous versions are forced and cannot be changed by the `extra_versions` field
    - `APP_SETTINGS` - A AppSettingsClass that can allow you to get the app settings n shit

- Added "InitState" state which is the new starting state instead of "TitleState"

### Scripting (Lua and HScript)

- [BOTH] Added "constants" variable : A link to the "Constants" class

## Changes

- MainMenuState now reads the `Constants.VERSIONS` list to make the watermark text (don't have too many mods enabled lol!)
- The "psych-ui" assets folder has been removed from the embed folder to the "shared/images" folder
- Removed support for "Português (Brasil)" language (I don't speak it, sorry ;-;)
- Removed [FreeDesktop](https://www.freedesktop.org/wiki) metadata
- The "TITLE_SCREEN_EASTER_EGG" compiler flag has been renamed to "PSYCH_TITLE_EASTER_EGG"
- The application filename is now "Nerel"
- The application window is now "Friday Night Funkin': Nerel Engine"
