class DXRAugShield injects AugShield;

// vanilla level 1 is 0.80 (20%) but rounding causes it to show as 19%, same issue with level 2
// vanilla EnergyRate is 40, mpEnergyDrain is 25
defaultproperties
{
    bAutomatic=true
    EnergyRate=25
    LevelValues(0)=0.799999
    LevelValues(1)=0.599999
    Level5Value=0.05
}
