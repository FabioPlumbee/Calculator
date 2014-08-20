/**
 * @Author: Jakub Pudelek, Plumbee Ltd
 */
package Views {
import Models.Operators.Operator;
import Models.Operators.OperatorFactory;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.TextField;

public class Calculator extends Sprite {
    private var _text:String;
    private var _textField:TextField;

    public function Calculator() {
        _textField = new TextField();
        this.addChild(_textField);

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
        addButton(60,40,"+",PressOperatorAdd);
        addButton(60,60,"-",PressOperatorSub);
        addButton(80,20,"*",PressOperatorMul);
        addButton(80,40,"/",PressOperatorDiv);
        addButton(80,60,"=",PressOperatorEqs);
    }

    private function addButton(x:int,y:int,key:String,fn:Function):void {
        var tbutton:TextButton = new TextButton(x, y, key);
        this.addChild(tbutton);
        tbutton.addEventListener(MouseEvent.CLICK, fn);
    }

    private function PressCalcNumber1(event:Event):void { pressCalcNumber(1) }
    private function PressCalcNumber2(event:Event):void { pressCalcNumber(2) }
    private function PressCalcNumber3(event:Event):void { pressCalcNumber(3) }
    private function PressCalcNumber4(event:Event):void { pressCalcNumber(4) }
    private function PressCalcNumber5(event:Event):void { pressCalcNumber(5) }
    private function PressCalcNumber6(event:Event):void { pressCalcNumber(6) }
    private function PressCalcNumber7(event:Event):void { pressCalcNumber(7) }
    private function PressCalcNumber8(event:Event):void { pressCalcNumber(8) }
    private function PressCalcNumber9(event:Event):void { pressCalcNumber(9) }
    private function PressCalcNumber0(event:Event):void { pressCalcNumber(0) }
    private function PressOperatorAdd(event:Event):void { pressOperator(OperatorFactory.PLUS) }
    private function PressOperatorSub(event:Event):void { pressOperator(OperatorFactory.MINUS) }
    private function PressOperatorMul(event:Event):void { pressOperator(OperatorFactory.MULTIPLY) }
    private function PressOperatorDiv(event:Event):void { pressOperator(OperatorFactory.DIVIDE) }
    private function PressOperatorEqs(event:Event):void { pressOperator(OperatorFactory.EQUALS) }

    public function updateText(number:Number):void {
        _text = String(number);
        _textField.text = _text;
    }
}
}
