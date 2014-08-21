/**
 * @Author: Fabio Barata, Plumbee Ltd
 */
package Commands {
import Commands.Operators.OperatorFactory;

import Events.NumberEvent;
import Events.UpdateTextEvent;

import Models.CalculatorModel;

import flash.events.IEventDispatcher;

import robotlegs.bender.bundles.mvcs.Command;

public class NumberCommand extends Command {
    [Inject]
    public var numberEvent:NumberEvent;

    [Inject]
    public var model:CalculatorModel;

    [Inject]
    public var eventDispatcher:IEventDispatcher;

    override public function execute():void {
        var n:Number = numberEvent.number;

        if (model.useResult) {
            model.curNumber = n;
            model.lastNumber = 0;
            model.op = OperatorFactory.PLUS;
            model.useResult = false;
        }
        else
            model.curNumber = 10*model.curNumber+n;

        model.numberToShow = model.curNumber;

        eventDispatcher.dispatchEvent(new UpdateTextEvent());
    }
}
}
