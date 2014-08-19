/**
 * @Author: Jakub Pudelek, Plumbee Ltd
 */
package {
import Operators.Divide;
import Operators.Equals;
import Operators.Minus;
import Operators.Multiply;
import Operators.Numeric;
import Operators.Operator;
import Operators.Plus;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.TextField;

public class Calculator extends Sprite {
    private var lastn:Number = 0;
    private var curn:Number = 0;
    private var text:String;
    private var textField:TextField;

    private var op:Class = null;

    public function Calculator() {
        textField = new TextField();
        this.addChild(textField);

        var tbutton1:TextButton = new TextButton(00,20,"1");
        this.addChild(tbutton1);
        tbutton1.addEventListener(MouseEvent.CLICK, PressCalcNumber1);
        var tbutton2:TextButton = new TextButton(20,20,"2");
        this.addChild(tbutton2);
        tbutton2.addEventListener(MouseEvent.CLICK, PressCalcNumber2);
        var tbutton3:TextButton = new TextButton(40,20,"3");
        this.addChild(tbutton3);
        tbutton3.addEventListener(MouseEvent.CLICK, PressCalcNumber3);
        var tbutton4:TextButton = new TextButton(00,40,"4");
        this.addChild(tbutton4);
        tbutton4.addEventListener(MouseEvent.CLICK, PressCalcNumber4);
        var tbutton5:TextButton = new TextButton(20,40,"5");
        this.addChild(tbutton5);
        tbutton5.addEventListener(MouseEvent.CLICK, PressCalcNumber5);
        var tbutton6:TextButton = new TextButton(40,40,"6");
        this.addChild(tbutton6);
        tbutton6.addEventListener(MouseEvent.CLICK, PressCalcNumber6);
        var tbutton7:TextButton = new TextButton(00,60,"7");
        this.addChild(tbutton7);
        tbutton7.addEventListener(MouseEvent.CLICK, PressCalcNumber7);
        var tbutton8:TextButton = new TextButton(20,60,"8");
        this.addChild(tbutton8);
        tbutton8.addEventListener(MouseEvent.CLICK, PressCalcNumber8);
        var tbutton9:TextButton = new TextButton(40,60,"9");
        this.addChild(tbutton9);
        tbutton9.addEventListener(MouseEvent.CLICK, PressCalcNumber9);
        var tbutton0:TextButton = new TextButton(60,20,"0");
        this.addChild(tbutton0);
        tbutton0.addEventListener(MouseEvent.CLICK, PressCalcNumber0);
        var tbuttona:TextButton = new TextButton(60,40,"+");
        this.addChild(tbuttona);
        tbuttona.addEventListener(MouseEvent.CLICK, PressOperatorAdd);
        var tbuttons:TextButton = new TextButton(60,60,"-");
        this.addChild(tbuttons);
        tbuttons.addEventListener(MouseEvent.CLICK, PressOperatorSub);
        var tbuttonm:TextButton = new TextButton(80,20,"*");
        this.addChild(tbuttonm);
        tbuttonm.addEventListener(MouseEvent.CLICK, PressOperatorMul);
        var tbuttond:TextButton = new TextButton(80,40,"/");
        this.addChild(tbuttond);
        tbuttond.addEventListener(MouseEvent.CLICK, PressOperatorDiv);
        var tbuttone:TextButton = new TextButton(80,60,"=");
        this.addChild(tbuttone);
        tbuttone.addEventListener(MouseEvent.CLICK, PressOperatorEqs);
    }

    private function PressCalcNumber1(event:Event):void { PressCalcNumber(1) }
    private function PressCalcNumber2(event:Event):void { PressCalcNumber(2) }
    private function PressCalcNumber3(event:Event):void { PressCalcNumber(3) }
    private function PressCalcNumber4(event:Event):void { PressCalcNumber(4) }
    private function PressCalcNumber5(event:Event):void { PressCalcNumber(5) }
    private function PressCalcNumber6(event:Event):void { PressCalcNumber(6) }
    private function PressCalcNumber7(event:Event):void { PressCalcNumber(7) }
    private function PressCalcNumber8(event:Event):void { PressCalcNumber(8) }
    private function PressCalcNumber9(event:Event):void { PressCalcNumber(9) }
    private function PressCalcNumber0(event:Event):void { PressCalcNumber(0) }
    private function PressOperatorAdd(event:Event):void { PressOperator(Plus) }
    private function PressOperatorSub(event:Event):void { PressOperator(Minus) }
    private function PressOperatorMul(event:Event):void { PressOperator(Multiply) }
    private function PressOperatorDiv(event:Event):void { PressOperator(Divide) }
    private function PressOperatorEqs(event:Event):void { PressOperator(Equals) }

    private function updateText():void {
        text = String(curn);
        textField.text = text;
    }

    private var lock:Boolean = false;

    public function PressCalcNumber(n:int):void {
        if (!lock) {
            curn = 0;
            lock = true;
        }
        curn = 10*curn+n;
        updateText();
    }

    public function PressOperator(op:Class):void {
        curn = DoOperation();
        updateText();
        lastn = curn;
        if (op != Equals)
            curn = 0;
        else
            lock = false;
        this.op = op;
    }

    private function DoOperation():Number {
        var operator:Operator;

        if (op == null)
            operator = new Numeric(curn);
        else if (op == Equals)
            operator = new Equals(new Numeric(lastn));
        else
            operator = new op(new Numeric(lastn),new Numeric(curn));

        return operator.Execute();
    }
}
}
