//=============================================================================
// MenuChoice_PasswordAutofill
//=============================================================================

class MenuChoice_UTMusic extends MenuUIChoiceEnum;

var DXRMusic m;

// only need to override GetGameSongs in subclasses, and default actionText
function GetGameSongs(out string songs[100])
{
    m.GetUTSongs(songs);
}

function DXRMusic GetDXRMusic()
{
    if(m != None) return m;
    foreach player.AllActors(class'DXRMusic', m) {
        return m;
    }
    return None;
}

function SetValue(int newValue)
{
    Super.SetValue(newValue);
    SaveSetting();
}


// ----------------------------------------------------------------------
// InitWindow()
//
// Initialize the Window
// ----------------------------------------------------------------------

event InitWindow()
{
    Super.InitWindow();

    PopulateOptions();

    SetInitialOption();

    SetActionButtonWidth(179);
}

// ----------------------------------------------------------------------
// PopulateCycleTypes()
// ----------------------------------------------------------------------

function PopulateOptions()
{
    local int typeIndex;

    enumText[0] = "Disabled";
    enumText[1] = "Enabled";
}

// ----------------------------------------------------------------------
// SetInitialCycleType()
// ----------------------------------------------------------------------

function SetInitialOption()
{
    local string songs[100];
    local bool bEnabled;

    if(GetDXRMusic() != None) {
        GetGameSongs(songs);
        bEnabled = m.AreGameSongsEnabled(songs);
        log(self$" SetInitialOption "$bEnabled);
        Super.SetValue(int(bEnabled));
    }
}

// ----------------------------------------------------------------------
// SaveSetting()
// ----------------------------------------------------------------------

function SaveSetting()
{
    local string songs[100];
    local bool bEnabled;

    bEnabled = bool(GetValue());
    log(self$" SaveSetting "$bEnabled);
    if(GetDXRMusic() != None) {
        GetGameSongs(songs);
        m.SetEnabledGameSongs(songs, bEnabled);
        m.SaveConfig();
    }
}

// ----------------------------------------------------------------------
// LoadSetting()
// ----------------------------------------------------------------------

function LoadSetting()
{
    log(self$" LoadSetting");
    SetInitialOption();
}

// ----------------------------------------------------------------------
// ResetToDefault
// ----------------------------------------------------------------------

function ResetToDefault()
{
    log(self$" ResetToDefault");
    SetValue(0);
    SaveSetting();
}

// ----------------------------------------------------------------------
// ----------------------------------------------------------------------

defaultproperties
{
    defaultInfoWidth=243
    defaultInfoPosX=203
#ifdef injections
    HelpText="Ensure the UMX files are in the right place. You can also edit DXRMusic.ini for further customization."
#else
    HelpText="Ensure the UMX files are in the right place. You can also edit #var(package)Music.ini for further customization."
#endif
    actionText="Unreal Tournament Music"
}
