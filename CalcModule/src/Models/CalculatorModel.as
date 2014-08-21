/**
 * @Author: Fabio Barata, Plumbee Ltd
 */
package Models {
import Commands.Operators.OperatorFactory;

public class CalculatorModel {
    private var _lastNumber:Number = 0;
    private var _curNumber:Number = 0;
    private var _useResult:Boolean = false;
    private var _numberToShow:Number = 0;
    private var _op:int = OperatorFactory.PLUS;

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

    public function get useResult():Boolean {
        return _useResult;
    }

    public function set useResult(value:Boolean):void {
        _useResult = value;
    }

    public function get numberToShow():Number {
        return _numberToShow;
    }

    public function set numberToShow(value:Number):void {
        _numberToShow = value;
    }

    public function get op():int {
        return _op;
    }

    public function set op(value:int):void {
        _op = value;
    }
}
}
