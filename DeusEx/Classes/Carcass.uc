class Carcass injects DeusExCarcass;

function InitFor(Actor Other)
{
    if( Other != None ) {
        DrawScale = Other.DrawScale;
        Fatness = Other.Fatness;
    }
    
    Super.InitFor(Other);
}

function DropKeys()
{
    local Inventory item, nextItem;

    item = Inventory;
    while( item != None ) {
        nextItem = item.Inventory;
        if( item.IsA('NanoKey') ) {
            DeleteInventory(item);
            item.DropFrom(Location);
        }
        item = nextItem;
    }
}

function Destroyed()
{
    DropKeys();
    Super.Destroyed();
}
