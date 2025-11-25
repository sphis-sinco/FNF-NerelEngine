# Neral Alpha 0.1.0
## Additions
- Added AppSettings : A JSON file containing information on the application
    - (Default) location: `assets/data/shared/app/settings.json`
    - Fields:
       - `save_name` - controls the name of your save file.
- Added "Constants" class : QOL class for holding information that will (most likely) be used all over
- Added "InitState" state which is the new starting state instead of "TitleState"

### Scripting (Lua and HScript)
- [BOTH] Added "constants" variable : A link to the "Constants" class

## Changes
- The "psych-ui" assets folder has been removed from the embed folder to the "shared/images" folder
- Removed support for "Português (Brasil)" language (I don't speak it, sorry ;-;)
- Removed [FreeDesktop](https://www.freedesktop.org/wiki) metadata
- The "TITLE_SCREEN_EASTER_EGG" compiler flag has been renamed to "PSYCH_TITLE_EASTER_EGG"
- The application filename is now "Nerel"
- The application window is now "Friday Night Funkin': Nerel Engine"