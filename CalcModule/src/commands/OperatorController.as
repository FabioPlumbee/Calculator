/**
 * @Author: Jakub Pudelek, Plumbee Ltd
 */
package Commands {
import Events.OperatorEvent;
import Events.UpdateTextEvent;

import Models.OperatorModel;

import Models.Operators.Operator;

import Models.Operators.OperatorFactory;

import flash.events.IEventDispatcher;

import robotlegs.bender.bundles.mvcs.Command;

public class OperatorController extends Command {
    private var _op:int = OperatorFactory.PLUS;

    [Inject]
    public var operatorEvent:OperatorEvent;

    [Inject]
    public var model:OperatorModel;

    [Inject]
    public var eventDispatcher:IEventDispatcher;

    override public function execute():void {
        var op:int = operatorEvent.op;

        model.curNumber = doOperation();
        model.numberToShow = model.curNumber;
        model.lastNumber = model.curNumber;
        if (op != OperatorFactory.EQUALS)
            model.curNumber = 0;
        else
            model.lastOpWasEquals = false;
        this._op = op;
        eventDispatcher.dispatchEvent(new UpdateTextEvent());
    }

    private function doOperation():Number {
        var operator:Operator = OperatorFactory.createOperator(_op,OperatorFactory.createNumber(model.lastNumber),OperatorFactory.createNumber(model.curNumber));

        return operator.Execute();
    }
}
}
