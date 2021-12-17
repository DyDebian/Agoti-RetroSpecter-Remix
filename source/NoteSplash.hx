package;

import flixel.FlxSprite;

using StringTools;

class NoteSplash extends FlxSprite
{
    public function new(x:Float,y:Float)
    {
        super(x,y);

        frames = Paths.getSparrowAtlas('NOTESPLASHES', 'shared');
        animation.addByPrefix('splash 0',"Note_Impact_Purple",24,false);
        animation.addByPrefix('splash 1',"Note_Impact_Blue",24,false);
        animation.addByPrefix('splash 2',"Note_Impact_Green",24,false);
        animation.addByPrefix('splash 3',"Note_Impact_Red",24,false);
        offset.x += 310;
        offset.y += 215;
        alpha = 0.5;
        animation.finishCallback = function(deletsplash) kill();
    }
}