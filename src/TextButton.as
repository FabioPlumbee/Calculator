/**
 * Created by fabio on 18/08/2014.
 */
package {
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.TextField;

public class TextButton extends Sprite {
    private var text:String;

    private static const colors:Array = [0x000000,0x0030A0];
    private static const alphas:Array = [100,100];
    private static const ratio:Array = [64,192];
    private static const textColor:int = 0xFFFFFF;

    public function TextButton(x:int,y:int,text:String) {
        this.x = x;
        this.y = y;

        this.text=text;

        this.addEventListener(Event.ADDED_TO_STAGE,drawButton);
    }

    private function drawButton(event:Event):void {
        var txt:TextField = new TextField();
        txt.textColor = textColor;
        txt.text = text;
        txt.x = 4;
        txt.y = 0;
        txt.mouseEnabled = false;

        //var w:int = txt.textWidth+12;
        var w:int = 17;
        var h:int = txt.textHeight+4;

        var rect:Sprite = new Sprite;
        rect.graphics.clear();
        rect.graphics.beginGradientFill("linear",colors,alphas,ratio);
        rect.graphics.drawRoundRect(0,0,w,h,5,5);
        rect.graphics.endFill();

        rect.width = w;
        rect.height = h;

        this.addChild(rect);
        this.addChild(txt);

        this.removeEventListener(Event.ADDED_TO_STAGE,drawButton);
    }
}
}
