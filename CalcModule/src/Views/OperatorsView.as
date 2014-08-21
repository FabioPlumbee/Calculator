/**
 * @Author: Fabio Barata, Plumbee Ltd
 */
package Views {
import Events.OperatorPressedEvent;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

public class OperatorsView extends Sprite implements IOperatorsView {
    public function OperatorsView() {
        addButton(60,40,"+",PressOperatorAdd);
        addButton(60,60,"-",PressOperatorSub);
        addButton(80,20,"*",PressOperatorMul);
        addButton(80,40,"/",PressOperatorDiv);
        addButton(80,60,"=",PressOperatorEqs);
    }

    private function addButton(x:int,y:int,key:String,fn:Function):void {
        var button:TextButton = new TextButton(x, y, key);
        this.addChild(button);
        button.addEventListener(MouseEvent.CLICK, fn);
    }

    private function PressOperatorAdd(event:Event):void { dispatchEvent(new OperatorPressedEvent(OperatorPressedEvent.plusType)); }
    private function PressOperatorSub(event:Event):void { dispatchEvent(new OperatorPressedEvent(OperatorPressedEvent.minusType)); }
    private function PressOperatorMul(event:Event):void { dispatchEvent(new OperatorPressedEvent(OperatorPressedEvent.multiplyType)); }
    private function PressOperatorDiv(event:Event):void { dispatchEvent(new OperatorPressedEvent(OperatorPressedEvent.divideType)); }
    private function PressOperatorEqs(event:Event):void { dispatchEvent(new OperatorPressedEvent(OperatorPressedEvent.equalsType)); }
}
}
