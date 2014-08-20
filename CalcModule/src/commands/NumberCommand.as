/**
 * @Author: Jakub Pudelek, Plumbee Ltd
 */
package Commands {
import Events.NumberEvent;
import Events.UpdateTextEvent;

import Models.OperatorModel;

import flash.events.IEventDispatcher;

import robotlegs.bender.bundles.mvcs.Command;

public class NumberCommand extends Command {
    [Inject]
    public var numberEvent:NumberEvent;

    [Inject]
    public var model:OperatorModel;

    [Inject]
    public var eventDispatcher:IEventDispatcher;

    override public function execute():void {
        var n:Number = numberEvent.number;

        if (model.lastOpWasEquals) {
            model.curNumber = n;
            model.lastOpWasEquals = false;
        }
        else
            model.curNumber = 10*model.curNumber+n;

        eventDispatcher.dispatchEvent(new UpdateTextEvent());
    }
}
}
