
package Commands {
import Events.OperatorEvent;
import Events.UpdateTextEvent;

import Models.CalculatorModel;

import Commands.Operators.Operator;

import Commands.Operators.OperatorFactory;

import flash.events.IEventDispatcher;

import robotlegs.bender.bundles.mvcs.Command;

public class OperatorController extends Command {
    [Inject]
    public var operatorEvent:OperatorEvent;

    [Inject]
    public var model:CalculatorModel;

    [Inject]
    public var eventDispatcher:IEventDispatcher;

    override public function execute():void {
        var op:int = operatorEvent.op;

        model.curNumber = doOperation();
        model.numberToShow = model.curNumber;
        model.lastNumber = model.curNumber;

        if (op != OperatorFactory.EQUALS) {
            model.useResult = false;
            model.curNumber = 0;
        }
        else
            model.useResult = true;

        model.op = op;
        eventDispatcher.dispatchEvent(new UpdateTextEvent());
    }

    private function doOperation():Number {
        var operator:Operator = OperatorFactory.createOperator(model.op,OperatorFactory.createNumber(model.lastNumber),OperatorFactory.createNumber(model.curNumber));

        return operator.Execute();
    }
}
}
