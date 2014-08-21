/**
 * @Author: Fabio Barata, Plumbee Ltd
 */
package Mediators {
import Events.UpdateTextEvent;

import Models.CalculatorModel;

import Views.ICalcTextView;

import flash.events.Event;
import robotlegs.bender.bundles.mvcs.Mediator;

public class TextMediator extends Mediator {
    [Inject]
    public var calculator:ICalcTextView;

    [Inject]
    public var model:CalculatorModel;

    override public function initialize():void {
        addContextListener(UpdateTextEvent.eventType,onUpdateText);
    }

    public function onUpdateText(event:Event):void {
        calculator.updateText(model.numberToShow);
    }
}
}
