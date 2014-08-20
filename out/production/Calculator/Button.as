/**
 * Created by fabio on 18/08/2014.
 */
package {
import flash.display.Sprite;
import flash.events.Event;

public class Button extends Sprite {
    private static const colors:Array = [0x00FF00,0xFF0000];
    private static const alphas:Array = [100,100];
    private var ratio:Array = [0,0xFF];

    public function Button(x:int,y:int) {
        this.x = x;
        this.y = y;
        this.rotation = 83;
        this.scaleX = 1;
        updateButton();
        addEventListener(Event.ENTER_FRAME, onEnterFrameLoop);
    }

    private function onEnterFrameLoop(event:Event):void {
        updateButton();
    }

    private function updateButton():void {
        ratio[0] += Math.floor(Math.random()*11)-5;
        ratio[1] += Math.floor(Math.random()*11)-5;

        if (ratio[0] > 127)
            ratio[0] = 127;
        else if (ratio[0] < 0)
            ratio[0] = 0;
        if (ratio[1] < 128)
            ratio[1] = 128;
        else if (ratio[1] > 255)
            ratio[1] = 255;

        this.graphics.clear();
        this.graphics.beginGradientFill("linear",colors,alphas,ratio);
        this.graphics.drawRoundRect(0,0,100,100,20,10);
        this.graphics.endFill();
    }
}
}
