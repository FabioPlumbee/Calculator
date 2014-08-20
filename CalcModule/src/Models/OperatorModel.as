/**
 * @Author: Jakub Pudelek, Plumbee Ltd
 */
package Models {
public class OperatorModel {
    private var _lastNumber:Number = 0;
    private var _curNumber:Number = 0;
    private var _eqWasLast:Boolean = false;
    private var _numberToShow:int = 0;

    public function get lastNumber():Number {
        return _lastNumber;
    }

    public function set lastNumber(value:Number):void {
        _lastNumber = value;
    }

    public function get curNumber():Number {
        return _curNumber;
    }

    public function set curNumber(value:Number):void {
        _curNumber = value;
    }

    public function get lastOpWasEquals():Boolean {
        return _eqWasLast;
    }

    public function set lastOpWasEquals(value:Boolean):void {
        _eqWasLast = value;
    }

    public function get numberToShow():int {
        return _numberToShow;
    }

    public function set numberToShow(value:int):void {
        _numberToShow = value;
    }
}
}
