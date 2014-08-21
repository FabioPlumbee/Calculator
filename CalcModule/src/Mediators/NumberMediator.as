/**
 * @Author: Fabio Barata, Plumbee Ltd
 */
package Mediators {
import Events.NumberCommandEvent;
import Events.NumberPressedEvent;

import robotlegs.bender.bundles.mvcs.Mediator;

public class NumberMediator extends Mediator {
    override public function initialize():void {
        addViewListener(NumberPressedEvent.eventType,onNumberPressed);
    }

    public function onNumberPressed(event:NumberPressedEvent):void {
        dispatch(new NumberCommandEvent(event.number));
    }
}
}
