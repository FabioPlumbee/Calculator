/**
 * @Author: Fabio Barata, Plumbee Ltd
 */
package Views {
import Events.NumberPressedEvent;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

public class NumbersView extends Sprite implements INumbersView {
    public function NumbersView() {
        addButton(00,20,"1",PressCalcNumber1);
        addButton(20,20,"2",PressCalcNumber2);
        addButton(40,20,"3",PressCalcNumber3);
        addButton(00,40,"4",PressCalcNumber4);
        addButton(20,40,"5",PressCalcNumber5);
        addButton(40,40,"6",PressCalcNumber6);
        addButton(00,60,"7",PressCalcNumber7);
        addButton(20,60,"8",PressCalcNumber8);
        addButton(40,60,"9",PressCalcNumber9);
        addButton(60,20,"0",PressCalcNumber0);
    }

    private function addButton(x:int,y:int,key:String,fn:Function):void {
        var button:TextButton = new TextButton(x, y, key);
        this.addChild(button);
        button.addEventListener(MouseEvent.CLICK, fn);
    }

    private function PressCalcNumber1(event:Event):void { dispatchEvent(new NumberPressedEvent(1)); }
    private function PressCalcNumber2(event:Event):void { dispatchEvent(new NumberPressedEvent(2)); }
    private function PressCalcNumber3(event:Event):void { dispatchEvent(new NumberPressedEvent(3)); }
    private function PressCalcNumber4(event:Event):void { dispatchEvent(new NumberPressedEvent(4)); }
    private function PressCalcNumber5(event:Event):void { dispatchEvent(new NumberPressedEvent(5)); }
    private function PressCalcNumber6(event:Event):void { dispatchEvent(new NumberPressedEvent(6)); }
    private function PressCalcNumber7(event:Event):void { dispatchEvent(new NumberPressedEvent(7)); }
    private function PressCalcNumber8(event:Event):void { dispatchEvent(new NumberPressedEvent(8)); }
    private function PressCalcNumber9(event:Event):void { dispatchEvent(new NumberPressedEvent(9)); }
    private function PressCalcNumber0(event:Event):void { dispatchEvent(new NumberPressedEvent(0)); }
}
}
